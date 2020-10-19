package com.my.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.spring.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;

	@GetMapping("boardList")
	public String boardList(Model model) throws Exception {
		log.info("boardList");
		model.addAttribute("boardList", service.getBoardList());
		return "boardList";
	}

	// void의 경우 url과 같은 경로의 폴더 경로에 jsp가 있어야 함
	// http://localhost:8080/spring/board/list
	// .../WEB-INF/views/board
	//	@GetMapping("list")
	//	public void list(Model model) {
	//		log.info("list");
	//		model.addAttribute("list", service.getList());
	//	}

	@RequestMapping("login")
	public String login() {
		return "login";
	}
}
