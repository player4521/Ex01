package com.my.spring.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.my.spring.dto.BoardDto;
import com.my.spring.mapper.board.BoardMapper;
import com.my.spring.service.BoardService;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	private BoardMapper mapper;

	@Override
	// 게시글 리스트 습득
	public List<BoardDto> getBoardList() throws Exception {
		return mapper.getBoardList();
	}

	@Override
	// 게시글 내용 확인
	public BoardDto getBoardContents(int bno) throws Exception {
		// 조회수 증가
		mapper.updateViewCnt(bno);
		return mapper.getBoardContents(bno);
	}

	@Override
	// 게시글 등록
	public void insertBoard(BoardDto boardDto) throws Exception {
		mapper.insertBoard(boardDto);
	}

	@Override
	// 게시글 수정
	public void modifyBoard(BoardDto boardDto) throws Exception {
	mapper.modifyBoard(boardDto);
	}

	// 게시글 삭제
	@Override
	public void deleteBoard(int bno) throws Exception {
		 mapper.deleteBoard(bno);
	}

}
