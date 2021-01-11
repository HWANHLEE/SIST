package com.example.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class LoginExceptionAdvice {
	// 로깅할 클래스(자기 자신 클래스)를 잡는다.
	private static final Logger logger = LoggerFactory.getLogger(LoginExceptionAdvice.class);
	
	@ExceptionHandler(VvsException.class)
	public String VvsExcept(Exception ex, Model model){
		logger.error("Exception ......" + ex.getMessage());
		model.addAttribute("exception", ex.getMessage());
		logger.error(model.toString());
		return "/membership/error";
	}
}
