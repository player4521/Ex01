package com.my.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.spring.common.Pagination;
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

	// 게시글 리스트 불러오기
	@GetMapping("boardList")
	public String boardList(Model model, @RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range) throws Exception {
		log.info("boardList");
		//전체 게시글 개수
		int listCnt = boardService.getBoardListCnt();
		//Pagination 객체생성
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		model.addAttribute("pagination", pagination);
		model.addAttribute("boardList", boardService.getBoardList(pagination));
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

	// 게시글 내용 불러오기
	@RequestMapping(value = "/getBoardContents", method = RequestMethod.GET)
	public String getBoardContent(Model model, @RequestParam("bno") int bno) throws Exception {
		log.info("board/boardContents");
		model.addAttribute("boardContents", boardService.getBoardContents(bno));
		return "board/boardContents";
	}

	// 게시글 작성 불러오기
	@RequestMapping("/boardWriteForm")
	public String boardWriteForm(@ModelAttribute("boardDto") BoardDto boardDto, Model model) throws Exception {
		log.info("boardWriteForm");
		return "board/boardWriteForm";
	}

	// 게시글 수정 불러오기
	@RequestMapping(value = "/modifyForm", method = RequestMethod.GET)
	// jsp에서 온 URL의?뒤의 값은@RequestParam으로 받음,변수가 여러개일 경우 &로 구분
	public String boardModifyForm(@RequestParam("bno") int bno, @RequestParam("mode") String mode, Model model)
			throws Exception {
		log.info("board/boardModifyForm");
		model.addAttribute("boardContents", boardService.getBoardContents(bno));
		model.addAttribute("mode", mode);
		model.addAttribute("boardDto", new BoardDto());
		return "board/boardModifyForm";
	}

	// 게시글 저장
	@RequestMapping(value = "/saveBoardForm", method = RequestMethod.POST)
	// redirect:를 사용할 경우 변수 RedirectAttributes rttr를 넘겨줘야함
	public String saveBoard(@ModelAttribute("BoardDto") BoardDto boardDto, @RequestParam("mode") String mode,
			RedirectAttributes rttr) throws Exception {
		log.info("redirect:/board/boardList");

		// 새 글 쓰기의 경우
		if (mode.equals("write")) {
			boardService.insertBoard(boardDto);

			// 글 수정의 경우
		} else if (mode.equals("modify")) {
			boardService.modifyBoard(boardDto);
		}
		return "redirect:/board/boardList";
	}

	// 게시글 삭제
	@RequestMapping(value = "/deleteBoard", method = RequestMethod.GET)
	public String deleteBoard(@RequestParam("bno") int bno, RedirectAttributes rttr) throws Exception {
		log.info("redirect:/board/boardList");
		boardService.deleteBoard(bno);
		return "redirect:/board/boardList";
	}

	// @ExceptionHandler를 이용한 예외처리
	// CommonExceptionAdvice를 이용한 예외처리와 겹치기 때문에 주석처리
	//	@ExceptionHandler(RuntimeException.class)
	//	public String exceptionHandler(Model model, Exception e) {
	//		log.info("exception : " + e.getMessage());
	//		model.addAttribute("exception", e);
	//		return "error/exception";
	//	}

}
