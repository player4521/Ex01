package com.my.spring.mapper.board;

import java.util.List;

import com.my.spring.common.Search;
import com.my.spring.dto.BoardDto;

public interface BoardMapper {

	public List<BoardDto> getBoardList(Search search);

	public BoardDto getBoardContents(int bno) throws Exception;

	public int insertBoard(BoardDto boardDto);

	public int modifyBoard(BoardDto boardDto) throws Exception;

	public int deleteBoard(int bno) throws Exception;

	public int updateViewCnt(int bno) throws Exception;

	public int getBoardListCnt(Search search) throws Exception;

}
