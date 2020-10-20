package com.my.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.spring.dto.BoardDto;
import com.my.spring.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller // 스프링에서 컨트롤러 역할을 하게 해줌(익스플로러의 파일 아이콘에 S표시가 붙음)
@Log4j2
@RequestMapping("/board/*") // "루트/board"경로로 접속을 시도하면 해당 컨트롤러가 담당을 한다
@AllArgsConstructor
public class BoardController {

	private BoardService boardService;

	@GetMapping("boardList")
	public String boardList(Model model) throws Exception {
		log.info("boardList");
		model.addAttribute("boardList", boardService.getBoardList());
		return "board/boardList";
	}

	// void의 경우 url과 같은 경로의 폴더 경로에 jsp가 있어야 함
	// http://localhost:8080/spring/board/list
	// .../WEB-INF/views/board
	//	@GetMapping("list")
	//	public void list(Model model) {
	//		log.info("list");
	//		model.addAttribute("list", service.getList());
	//	}

	@RequestMapping("/boardWriteForm")
	public String boardWriteForm() {
		log.info("boardWriteForm");
		return "board/boardWriteForm";
	}

	@RequestMapping(value = "/saveBoardForm", method = RequestMethod.POST)
	public String saveBoard(@ModelAttribute("BoardDto") BoardDto boardDto, RedirectAttributes rttr) throws Exception {
		log.info("redirect:/board/boardList");
		boardService.insertBoard(boardDto);
		return "redirect:/board/boardList";
	}

	@RequestMapping(value = "/getBoardContents", method = RequestMethod.GET)
	public String getBoardContent(Model model, @RequestParam("bno") int bno) throws Exception {
		model.addAttribute("boardContents", boardService.getBoardContents(bno));
		return "board/boardContents";
	}

	@RequestMapping(value = "/modifyForm", method = RequestMethod.GET)
	public String editForm(@RequestParam("bno") int bno, @RequestParam("mode") String mode, Model model) throws Exception {
		model.addAttribute("boardContents", boardService.getBoardContents(bno));
		model.addAttribute("mode", mode);
		model.addAttribute("boardDto", new BoardDto());
		return "board/boardModifyForm";
	}

}
