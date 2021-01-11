package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.service.DayService;

import lombok.extern.java.Log;

@Controller
@Log
@RequestMapping("/day")
public class DayController {
	@Autowired
	private DayService dayService;
	
	
}
