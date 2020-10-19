package com.my.spring.service;

import java.util.List;

import com.my.spring.dto.BoardDto;

public interface BoardService {
	public List<BoardDto> getBoardList() throws Exception;

//	public Map<String, Object> insertBoard(BoardDto boardDto) throws Exception;
}
