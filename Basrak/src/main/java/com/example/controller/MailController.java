package com.example.controller;

import java.net.MalformedURLException;
import java.util.Calendar;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.service.MailService;
import com.example.service.UserChoiceService;
import com.example.service.UserService;
import com.example.vo.UserVO;

import lombok.extern.java.Log;
/*checklist
 * userVO받아오기>nickname에 해당하는 email받아오기 (-)
 * d_seq, s_seq받아오기
 * s_seq에 해당하는 종목을 내용문으로
 * d_seq에 해당하는 날짜에 자동으로 메일보내기(매일매일 자동으로 메일은 가는데, 메일전송요일 = d_seq이 일치하는 회원의 메일주소로 전송되는 method필요)
 * 최선의 방법...회원4명한테 메일보내는데 20초걸림 
 * 이렇게하는게 맞는건가...
 * */

@Controller
@Log
public class MailController {
	@Autowired
	private UserService userService;
	@Autowired
	private UserChoiceService userCS;
	@Autowired
	private MailService mailService;

	Calendar cal = Calendar.getInstance();

	@RequestMapping(value = "/mailSender")
	public void mailSender(UserVO userVO, HttpServletRequest request, ModelMap mo)
			throws AddressException, MessagingException, MalformedURLException {
		// 먼저들어오는 값부터 확인
//		log.info("오늘날짜 확인 = " + cal);// 오늘날짜 확인
//		log.info("넘어온 userList =" + this.userService.readAll().toString());// 회원리스트 전부 확인

		int year = cal.get(Calendar.YEAR);// 년도
		int month = cal.get(Calendar.MONTH) + 1;// 월
		int date = cal.get(Calendar.DATE);// 일
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK) - 1;// 요일구하기(넘어온 d_seq(1~5)값이랑 비교)
//		log.info("오늘날짜요일 = " + dayOfWeek);// 요일 확인 원래는 1 :일 ~7 :토 인데 d_seq의 1 :월요일로 받을거니까 dayOfWeek에 -1함

		String korDayOfWeek = "";
		switch (dayOfWeek) {
		case 1: korDayOfWeek = "월요일";	break;
		case 2: korDayOfWeek = "화요일";	break;
		case 3: korDayOfWeek = "수요일";	break;
		case 4: korDayOfWeek = "목요일";	break;
		case 5: korDayOfWeek = "금요일";	break;
		case 0: korDayOfWeek = "주말";	break;
		}
//		log.info("요일 = " + korDayOfWeek);

		String d_seq = ""; // 회원이 선택한 요일을 할당하기 위한 변수
		String useremail = ""; // 회원 email
		String recipient = ""; // 수신자 email
		String userNickname = ""; // 사용자 테이블에서의 유저 닉네임
		String userChoiceNickname = ""; // 사용자 선택 테이블에서의 유저 닉네임

		for (int i = 0; i < this.userService.readAll().size(); i++) {// 일단 회원수만큼 readAll()로 다 불러오기
			useremail = this.userService.readAll().get(i).getEmail();// i번째 List에 해당하는 email
			recipient = (String) this.userService.read(useremail).getEmail();// i번째 List에 해당하는 nickname의 email
			userNickname = this.userService.read(useremail).getNickname(); // 사용자 선택테이블에서의 닉네임과 일치하는지 확인하기 위해 받아온다.

			// gmail smtp server를 사용한다.
			String host = "smtp.gmail.com";

			// naver smtp port
			int port = 465;

			// 발신자의 메일 주소(@gmail.com 은 빼고 작성)
			String username = "hwan4045";

			// 발신자의 PASSWORD
			final String password = "qhrtnddkvheh2!";

			//유저 선택에 따른 종목 배열
			String [] title = null;
			String [] link = null;
			String [] description = null;
			String sports_name = "";
			for (int j = 0; j < this.userCS.readAll().size(); j++) {
				String sports = this.userCS.readAll().get(j).getS_seq();
				switch(sports) {
				case "1" : title = this.mailService.soccer_title();		//축구
								link = this.mailService.soccer_link();
								description = this.mailService.soccer_description();
								sports_name = "축구";break;
				case "2" : title = this.mailService.baseball_title();		//야구
								link = this.mailService.baseball_link();
								description = this.mailService.baseball_description();		
								sports_name = "야구"; break;
				case "3" : title = this.mailService.basketball_title();	//농구
								link = this.mailService.basketball_link();
								description = this.mailService.basketball_description();		
								sports_name = "농구"; break;
				case "4" : title = this.mailService.volleyball_title();	//배구
								link = this.mailService.volleyball_link();
								description = this.mailService.volleyball_description();	
								sports_name = "배구"; break;
				case "5" : title = this.mailService.other_title();			//일반(OTHER)
								link = this.mailService.other_link();
								description = this.mailService.other_description();		
								sports_name = "일반"; 	break;
				default: title = null;	link = null; description = null;
				}	
			// 수신자에게 보낼 메일 제목
			String subject = "[" + year + "/" + month + "/" + date + "/" + korDayOfWeek + "]" + userNickname
										+ "님에게 도착한 바스락! [ " + sports_name + " ]";	
			// 수신자에게 보낼 메일 내용
			String contents = "<h1 style='text-align:center; color:rgb(20, 107, 69); font-family: Verdana, Gen'>오늘 도착한 Basrak</h1><hr/>";
			contents += "<h3 style='text-align:left; color:rgb(20, 107, 69); font-family: Verdana, Gen'> [ " + sports_name + " ] 기사 제목을 클릭하시면 해당 기사 페이지로 이동합니다:) </h3>";
			for(int t = 0; t < title.length; t++) {
			contents += "<div><U><h3 style='color:rgb(20, 107, 69); font-family: Verdana, Gen; font:bold '>" + "<a href='" + link[t] + "'>" + ((int)t+1) + " . " + title[t]+ "</a></U></h3>";
			contents += description[t];
			contents += "</div><br/>";
			}
    
			// SMTP 서버 설정 정보 세팅
			Properties props = System.getProperties();
			// smtp 서버
			props.put("mail.smtp.host", host);
			// smtp 포트
			props.put("mail.smtp.port", port);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.ssl.trust", host);

			// Session 생성 & 발신자 smtp 서버 로그인 인증
			Session session = Session.getInstance(props, new javax.mail.Authenticator() {
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
					return new javax.mail.PasswordAuthentication(username, password);
				}
			});

			session.setDebug(true); // 디버그 모드

			// MimeMessage 생성 & 메일 세팅
			Message mimeMessage = new MimeMessage(session);
			mimeMessage.setFrom(new InternetAddress(username)); // 발신자
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); // 수신자

			mimeMessage.setSubject(subject); // 제목
			// mimeMessage.setText(contents); // 내용

			// 평서문이 아닌 html 태그를 보내고 싶다면?
			mimeMessage.setContent(contents, "text/html; charset=UTF-8");

//			int flag = 1;    //   -->테스트 끝나고 나면 0으로 바꿔주세요
			int flag = 0;
			
			// 요일이랑 DB 회원이 선택한 요일을 맞춘다.
			for (int k = 0; k < this.userCS.readAll().size(); k++) {
				d_seq = this.userCS.readAll().get(j).getD_seq();
				String today_seq = Integer.toString(dayOfWeek);
				userChoiceNickname = this.userCS.readAll().get(j).getNickname();

				//--> 주말로는 테스트가 안돼서 막아놨어요! 테스트 하고 나면 풀어주세용(187라인 flag도 0인지 확인)
				if (userChoiceNickname.equals(userNickname) && d_seq.equals(today_seq)) {   
					// 성공시
					flag++;
				} else {
					// 아닐시
				}
			}

			// 회원이 선택한 요일과 현재 요일이 일치할시 플래그가 0에서 ++ 되면서 if 조건에 일치. 일치하게 되면서 메일이 전송 된다.
			if (flag >= 1) {
				Transport.send(mimeMessage); // 전송
				log.info("확인>>" + recipient + "에게 메일발송 완료");
				}
			}
		}
	}
}