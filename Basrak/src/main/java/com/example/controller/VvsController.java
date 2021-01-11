package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.exception.VvsException;
import com.example.service.VvsService;
import com.example.vo.UserVO;
import com.example.vo.VvsVO;

import lombok.extern.java.Log;

@Controller
@Log
@RequestMapping("/vvs")
public class VvsController {
	@Autowired
	private VvsService vvsService;
	
	// 게시판의 모든 글 목록을 가져온다.
	@GetMapping("/list")
	public String list(@RequestParam("page") int page, Model model) {
		int pageSize = 5;
		int totalPage = this.vvsService.getTotalPage(pageSize);
		
		List<VvsVO> list = this.vvsService.readAll();
		model.addAttribute("vvslist", list);
		model.addAttribute("currentPage", page);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalPage", totalPage);
		log.info(list.toString());
		
		return "/vvs/list";
	}
	
	@GetMapping("/read")
	public String read(@RequestParam("u_seq") String u_seq, Model model) {
		VvsVO vvsVO = this.vvsService.read(u_seq);
		model.addAttribute("vvs", vvsVO);
		
		return "/vvs/read";
	}
	
	@GetMapping("/readnumUpdate/{u_seq}")
	public void readnumUpdate(@PathVariable String u_seq) {
		this.vvsService.updateReadnum(u_seq);
	}
	
	@GetMapping("/write")
	public String write(HttpSession session) throws VvsException {
		
		Object obj = session.getAttribute("userInfo");
		if(obj == null) {
			throw new VvsException("게시판에 글을 쓰시려면 먼저 로그인해 주세요.");
		} else {
			return "/vvs/write";
		} 
	}
	
	@PostMapping("/write")
	public String writePost(VvsVO vvsVO, HttpSession session) {
		UserVO userVO = (UserVO)session.getAttribute("userInfo");
		vvsVO.setNickname(userVO.getNickname());
		this.vvsService.create(vvsVO);
		log.info("Controller에서 들어온 내용 " + vvsVO.toString());
		
		return "redirect:/vvs/list?page=1";
	}
	
	@GetMapping("/update")
	public String update(@RequestParam("u_seq") String u_seq, Model model) {
		VvsVO vvsVO = this.vvsService.read(u_seq);
		model.addAttribute("vvs", vvsVO);
		
		return "/vvs/update";
	}
	
	@PostMapping("/update")
	public String updatePost(VvsVO vvsVO) {
		this.vvsService.update(vvsVO);
		
		return "redirect:/vvs/read?u_seq=" + vvsVO.getU_seq();
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("u_seq") String u_seq) {
		this.vvsService.delete(u_seq);
		
		return "redirect:/vvs/list?page=1";
	}
}
