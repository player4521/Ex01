package com.my.spring.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class NotFoundException extends RuntimeException {
	// 예외처리 우선 순위에서 @ResponseStatus 보다 @ControllerAdvice가 우선함
	// 즉 예외발생시 CommonExceptionAdvice 클래스의 @ControllerAdvice가 실행됨
}
