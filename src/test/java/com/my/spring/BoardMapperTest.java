package com.my.spring;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.my.spring.dto.BoardDto;
import com.my.spring.mapper.board.BoardMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"classpath:spring/root-context.xml",
})
public class BoardMapperTest {

	private static final Logger logger = LoggerFactory.getLogger(BoardMapperTest.class);

	@Inject
	private BoardMapper mapper;

	@Test
	public void testInsertBoard() throws Exception {

		BoardDto boardDto = new BoardDto();
		boardDto.setCategory_cd("1");
		//	boardDto.setTitle("첫번째 게시물 입니다.");
		//	boardDto.setContent("첫번째 게시물입니다.");
		boardDto.setTag("1");
		boardDto.setReg_id("1");
		for (int i = 1; i < 1234; i++) {
			boardDto.setTitle(i + " 번째 게시물 입니다.");
			boardDto.setContent(i + " 번째 게시물 입니다.");
			int result = mapper.insertBoard(boardDto);
			logger.info("\n Insert Board Result " + result);
			if (result == 1) {
				logger.info("\n 게시물 등록 성공 ");
			} else {
				logger.info("\n 게시물 등록 실패");
			}
		}
	}

}
