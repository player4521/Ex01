package com.my.spring.common;

import lombok.Data;

@Data
public class Search extends Pagination{

	private String searchType;
	private String keyword;
}
