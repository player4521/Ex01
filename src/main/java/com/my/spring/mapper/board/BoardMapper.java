package com.my.spring.mapper.board;

import java.util.List;

import com.my.spring.common.Pagination;
import com.my.spring.dto.BoardDto;

public interface BoardMapper {

	public List<BoardDto> getBoardList(Pagination pagination);

	public BoardDto getBoardContents(int bno) throws Exception;

	public int insertBoard(BoardDto boardDto);

	public int modifyBoard(BoardDto boardDto) throws Exception;

	public int deleteBoard(int bno) throws Exception;

	public int updateViewCnt(int bno) throws Exception;

	public int getBoardListCnt() throws Exception;

}
