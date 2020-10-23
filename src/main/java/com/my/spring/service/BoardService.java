package com.my.spring.service;

import java.util.List;

import com.my.spring.common.Pagination;
import com.my.spring.dto.BoardDto;

public interface BoardService {
	public List<BoardDto> getBoardList(Pagination pagination) throws Exception;

	public BoardDto getBoardContents(int bno) throws Exception;

	public int insertBoard(BoardDto boardDto) throws Exception;

	public int modifyBoard(BoardDto boardDto) throws Exception;

	public int deleteBoard(int bno) throws Exception;

	public int getBoardListCnt() throws Exception;

}
