package com.my.spring.dto;

import java.sql.Date;

import lombok.Data;

@Data // lombok라이브러리를 이용하였기 때문에 getter/setter불필요
public class BoardDto {
	public int bno;
	public String category_cd;
	public String title;
	public String content;
	public String attachments;
	public String tag;
	public int view_cnt;
	public String reg_id;
	public Date reg_date;
	public Date mod_date;

}
