package com.my.spring.service;

import java.util.List;

import com.my.spring.dto.BoardDto;

public interface BoardService {
	public List<BoardDto> getBoardList() throws Exception;

	public BoardDto getBoardContents(int bno) throws Exception;

	public void insertBoard(BoardDto boardDto) throws Exception;

	public void modifyBoard(BoardDto boardDto) throws Exception;

	public void deleteBoard(int bno) throws Exception;
}
