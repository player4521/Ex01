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
	// 게시글 등록
	public void insertBoard(BoardDto boardDto) throws Exception {
		mapper.insertBoard(boardDto);
	}

	@Override
	// 게시글 내용 확인
	public BoardDto getBoardContents(int bid) throws Exception {
		// 조회수 증가
		mapper.updateViewCnt(bid);
		return mapper.getBoardContents(bid);
	}

}
