package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.service.FaqService;
import com.example.vo.FaqVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/faq")
@Slf4j
public class FaqController {
	@Autowired
	private FaqService faqService;
	
	// 게시판의 모든 글 목록을 가져온다
	@GetMapping("/list")
	public String list(@RequestParam("page") int page ,Model model) {
		// 페이지 번호
		int pageSize = 3;
		int totalPage = this.faqService.getTotalPage(pageSize);
		
		// 전체 레코드를 조회하는 코드
		List<FaqVO> list = this.faqService.readAll();
		
		model.addAttribute("faqlist", list);
		model.addAttribute("currentPage", page);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalPage", totalPage);
//		log.info("faq의 값 : " + list.toString());
		
		return "/faq/list";			//WEB-INF/views/faq/list.jsp
	}
	
	// 조회수 증가
	@GetMapping("/readnumUpdate/{f_seq}")	// controller가 글번호를 받아온다
	public void readnumUpdate(@PathVariable String f_seq) {
		this.faqService.updateReadnum(f_seq); // qnaService로 넘긴다
	}
	
	@GetMapping("/read")
	public String read(@RequestParam("f_seq") String f_seq, Model model) {
		FaqVO faqVO = this.faqService.read(f_seq);
		model.addAttribute("faq", faqVO);
		
		return "/faq/read";		//WEB-INF/views/faq/read.jsp
	}
}
