package com.my.spring.dto;

import java.sql.Date;

import lombok.Data;

@Data // lombok라이브러리를 이용하였기 때문에 getter/setter불필요
public class BoardDto {
	private long bno;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private Date updateDate;

}
