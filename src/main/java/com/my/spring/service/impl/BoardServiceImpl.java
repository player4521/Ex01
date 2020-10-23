package com.my.spring.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.my.spring.common.Pagination;
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
	public List<BoardDto> getBoardList(Pagination pagination) throws Exception {
		return mapper.getBoardList(pagination);
	}

	@Override
	@Transactional
	// 게시글 내용 확인
	public BoardDto getBoardContents(int bno) throws Exception {
		// 조회수 증가
		mapper.updateViewCnt(bno);
		return mapper.getBoardContents(bno);
	}

	@Override
	@Transactional
	// 게시글 등록
	public int insertBoard(BoardDto boardDto) throws Exception {
		return mapper.insertBoard(boardDto);
	}

	@Override
	@Transactional
	// 게시글 수정
	public int modifyBoard(BoardDto boardDto) throws Exception {
		return mapper.modifyBoard(boardDto);
	}

	@Override
	@Transactional
	// 게시글 삭제
	public int deleteBoard(int bno) throws Exception {
		return mapper.deleteBoard(bno);
	}

	//총 게시글 개수 확인
	@Override
	public int getBoardListCnt() throws Exception {
		return mapper.getBoardListCnt();
	}
}
