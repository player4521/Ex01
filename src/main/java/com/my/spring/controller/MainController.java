package com.my.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller								// 스프링에서 컨트롤러 역할을 하게 해줌(익스플로러의 파일 아이콘에 S표시가 붙음)
@RequestMapping("/Main")				// "루트/Main"경로로 접속을 시도하면 해당 컨트롤러가 담당을 한다
public class MainController {

	@RequestMapping("home")
	public String main() {
		return "home";
	}

}
