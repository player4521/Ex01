package com.my.spring;

import static org.junit.Assert.*;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
//@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@ContextConfiguration("classpath:/spring/*-context.xml")
public class DataSourceTests {
	private static final Logger logger = LoggerFactory.getLogger(DataSourceTests.class);
	@Inject
	private DataSource dataSource;
	@Inject
	private SqlSessionFactory sqlSessionFactory;

	@Test
	public void testConnection() {
		try (Connection con = dataSource.getConnection()) {
			logger.info(con.toString());
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}

	@Test
	public void testMyBatis() {
		SqlSession session = sqlSessionFactory.openSession();
		Connection con = session.getConnection();
		logger.info("=== sesseion : " + session.toString());
		logger.info("=== con : " + con.toString());
	}

}
