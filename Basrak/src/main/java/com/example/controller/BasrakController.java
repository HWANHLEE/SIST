package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/basrak")
public class BasrakController {

	@GetMapping("/basrak")
	public String basrak() {
		
		return "/basrak/basrak";
	}
}
