package com.my.spring.service;

import java.util.List;

import com.my.spring.common.Search;
import com.my.spring.dto.BoardDto;

public interface BoardService {
	public List<BoardDto> getBoardList(Search search) throws Exception;

	public BoardDto getBoardContents(int bno) throws Exception;

	public int insertBoard(BoardDto boardDto) throws Exception;

	public int modifyBoard(BoardDto boardDto) throws Exception;

	public int deleteBoard(int bno) throws Exception;

	public int getBoardListCnt(Search search) throws Exception;

}
