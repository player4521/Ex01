package com.my.spring.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.my.spring.dto.BoardDto;
import com.my.spring.mapper.BoardMapper;
import com.my.spring.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{

	private BoardMapper mapper;

	@Override
	public List<BoardDto> getBoardList(){
		log.info("getList...");
		return mapper.getBoardList();
	}
}
