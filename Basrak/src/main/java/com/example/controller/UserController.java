package com.example.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.exception.LoginException;
import com.example.service.UserChoiceService;
import com.example.service.UserService;
import com.example.vo.UserChoiceVO;
import com.example.vo.UserVO;

import lombok.extern.java.Log;

@Controller
@Log
@RequestMapping("/membership")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private UserChoiceService userChoiceService;
	
	// 회원가입 : 회원가입 클릭하고 GET
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String register() {
		return "/membership/register"; //WEB-INF/views/membership/register.jsp
	}
	
	// 회원가입 : 닉네임/이메일/비밀번호 입력후 회원가입 클릭하고 POST
	@RequestMapping(value="/register", method =RequestMethod.POST)
	public String register1(UserVO userVO, Model model) {
//		log.info(userVO.toString());
		
		model.addAttribute("nickname", userVO.getNickname());	//
		this.userService.create(userVO);
		return "/membership/userchoice";//WEB-INF/views/membership/userchoice.jsp
	}
	
	// 닉네임 중복 : 같은 닉네임이 존재하는지 확인
	@RequestMapping(value="/nickNameCheck/{nickname}", method = RequestMethod.POST)
	public @ResponseBody Map nickNameCheck(@PathVariable String nickname) {
		UserVO userVO = this.userService.read(nickname);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", "success");
		if(userVO == null) map.put("result", true);
		else map.put("result", false);
		
		return map;
	}
	
	// 회원가입 : 닉네임, 이메일, 비밀번호 입력 후 요일과 종목 입력
	@RequestMapping(value="/userchoice", method=RequestMethod.GET)
	public String userchoice(UserChoiceVO userChoiceVO) {
		return "/membership/userchoice";
	}
	
	//회원가입 : 닉네임, 이메일, 비밀번호 입력 후 요일과 종목 입력
		@RequestMapping(value="/userchoice", method= RequestMethod.POST)
		public String userchoice1(HttpServletRequest request) {
			String [] dayArray = request.getParameterValues("day");
			String [] sportsArray = request.getParameterValues("sports");
			String nickname = request.getParameter("nickname").trim();
			
			UserChoiceVO ucv = new UserChoiceVO();
			
			for(int i = 0; i < dayArray.length; i++) {
				if(dayArray[i] != null) {
//					System.out.println(dayArray[i].toString());
					for(int j = 0; j < sportsArray.length; j ++) {
						if(sportsArray[j] != null) {
							String day = dayArray[i].toString().trim();
							ucv.setD_seq(day);
							
							String sports = sportsArray[j].toString().trim();
							ucv.setS_seq(sports);
							
							ucv.setNickname(nickname);

							this.userChoiceService.create(ucv);
						}	// close(if : sprots)
					}	// close(for : j)
				}	// close(if : day)
			}	// close(for : i)
			
			return "/index";
		}

	// 로그인 : 로그인클릭하고 GET
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "membership/login";//WEB-INF/views/membership/login.jsp
	}
	
	// 로그인 : 로그인정보입력후 로그인 클릭하고 POST
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login1(@RequestParam("email") String email,
								 			@RequestParam("passwd") String passwd,
								 			HttpSession session) throws LoginException{
		int result = this.userService.login(email, passwd);
		
		if(result == -1) throw new LoginException("존재하지 않는 이메일입니다.");
		else if(result == 0) throw new LoginException("비밀번호가 일치하지 않습니다.");
		else {
			UserVO userVO = this.userService.read(email);
			session.setAttribute("userInfo", userVO);
		}
		return "index";
	}
	
	//로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		UserVO userVO = (UserVO)session.getAttribute("userInfo");
		session.invalidate();//세션날리기(세션지우기)
		model.addAttribute("nickname", userVO.getNickname());
		return "membership/logout";//WEB-INF/views/membership/logout.jsp
	}
	
	//회원탈퇴
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(HttpSession session) {
		UserVO userVO = (UserVO)session.getAttribute("userInfo");
		session.invalidate();//세션날리고
		this.userService.delete(userVO.getNickname());
		
		return "redirect:/";
	}
	
	//회원정보보기
	@RequestMapping(value="/userinfo", method=RequestMethod.GET)
	public String userinfo(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("userInfo");
		String nickname = userVO.getNickname();
		
		String d_seq = this.userinfo_D_seq(nickname);
//		log.info("바스락할 요일 : " + d_seq);
		String s_seq = this.userinfo_S_seq(nickname);
		
		model.addAttribute("d_seq", d_seq);	//
		model.addAttribute("s_seq", s_seq);
		
		return "membership/userinfo"; //WEB-INF/views/membership/userinfo.jsp
	}
	
	public String userinfo_S_seq(String nickname) {
		String response_sports = "";
		String userChoiceNickname = "";
		String [] array = new String[10];
		int a = 0;
		int x1 = 0;  int x2 = 0; int x3 = 0; int x4 = 0; int x5 = 0;
		
		for(int i = 0; i < this.userChoiceService.readAll().size(); i++) {
			response_sports = this.userChoiceService.readAll().get(i).getS_seq();
			response_sports = this.change_sports(response_sports);
			userChoiceNickname = this.userChoiceService.readAll().get(i).getNickname();
			
			if(userChoiceNickname.equals(nickname)) {
				if(response_sports.equals("축구") && x1==0) {
					x1 = 1;
					array[a] = response_sports;
				} else if(response_sports.equals("야구") && x2==0){
					x2 = 2;
					array[a] = response_sports;
				} else if(response_sports.equals("농구") && x3==0){
					x3 = 3;
					array[a] = response_sports;
				} else if(response_sports.equals("배구") && x4==0){
					x4 = 4;
					array[a] = response_sports;
				} else if(response_sports.equals("일반") && x5==0){
					x5 = 5;
					array[a] = response_sports;
				}
				a++;
			}
		}
		
		String s_seq = "";
		
		for(int i = 0; i < array.length; i++) {
			if(array[i] != null) {
				s_seq += array[i] + " ";
			}
		}
		
		return s_seq;
	}
	
	// 해당 유저가 선택한 요일을 중복되지 않게 받아오는 용도
	public String userinfo_D_seq(String nickname) {
		String response_day = "";
		String userChoiceNickname = "";
		String [] array = new String[10];
		int a = 0;
		int x1 = 0;  int x2 = 0; int x3 = 0; int x4 = 0; int x5 = 0;
		
		for(int i = 0; i < this.userChoiceService.readAll().size(); i++) {
			response_day = this.userChoiceService.readAll().get(i).getD_seq();
			response_day = this.change_day(response_day);
			userChoiceNickname = this.userChoiceService.readAll().get(i).getNickname();
			
			if(userChoiceNickname.equals(nickname)) {
				if(response_day.equals("월요일") && x1==0) {
					x1 = 1;
					array[a] = response_day;
				} else if(response_day.equals("화요일") && x2==0){
					x2 = 2;
					array[a] = response_day;
				} else if(response_day.equals("수요일") && x3==0){
					x3 = 3;
					array[a] = response_day;
				} else if(response_day.equals("목요일") && x4==0){
					x4 = 4;
					array[a] = response_day;
				} else if(response_day.equals("금요일") && x5==0){
					x5 = 5;
					array[a] = response_day;
				}
				a++;
			}
		}
		String d_seq = "";
		
		for(int i = 0; i < array.length; i++) {
			if(array[i] != null) {
				d_seq += array[i] + " ";
			}
		}
		
		return d_seq;
	}
	
	public String change_sports (String response_sports) {
		String selected_sports = "";
		switch(response_sports) {
	       case "1" : selected_sports = "축구"; break;
	       case "2" : selected_sports = "야구"; break;
	       case "3" : selected_sports = "농구"; break;
	       case "4" : selected_sports = "배구"; break;
	       case "5" : selected_sports = "일반"; break;
       	}
		return selected_sports;
	}
	
	public String change_day (String response_day) {
		String korDayOfWeek = "";
		switch(response_day) {
	       case "1" : korDayOfWeek = "월요일"; break;
	       case "2" : korDayOfWeek = "화요일"; break;
	       case "3" : korDayOfWeek = "수요일"; break;
	       case "4" : korDayOfWeek = "목요일"; break;
	       case "5" : korDayOfWeek = "금요일"; break;
       	}
		return korDayOfWeek;
	}
	
	// 회원가입 : 닉네임, 이메일, 비밀번호 입력 후 요일과 종목 입력
		@RequestMapping(value="/userupdate", method=RequestMethod.GET)
		public String update(UserChoiceVO userChoiceVO) {
			return "/membership/userupdate";
		}
	
	
	@RequestMapping(value = "/userupdate", method = RequestMethod.POST)
	public String update(@RequestParam("nickname") String nickname, HttpServletRequest request) {
		this.userChoiceService.update(nickname);
		
		String [] dayArray = request.getParameterValues("day");
		String [] sportsArray = request.getParameterValues("sports");
		nickname = request.getParameter("nickname");
		log.info("-----------------------------------------------" + nickname);
		
		UserChoiceVO ucv = new UserChoiceVO();
		
		for(int i = 0; i < dayArray.length; i++) {
			if(dayArray[i] != null) {
//				System.out.println(dayArray[i].toString());
				for(int j = 0; j < sportsArray.length; j ++) {
					if(sportsArray[j] != null) {
						String day = dayArray[i].toString().trim();
						ucv.setD_seq(day);
						
						String sports = sportsArray[j].toString().trim();
						ucv.setS_seq(sports);
						
						ucv.setNickname(nickname);

						this.userChoiceService.create(ucv);
					}	// close(if : sprots)
				}	// close(for : j)
			}	// close(if : day)
		}	// close(for : i)
		return "/membership/userinfo";
	}
	
}