<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="user" value="${userInfo}" />

<link rel="stylesheet" href="/basrak/static/css/bootstrap.css">
<link rel="stylesheet" href="/basrak/static/css/login.css">
<script src="/basrak/static/js/jquery.min.js"></script>
<script src="/basrak/static/js/jquery-3.5.1.js"></script>
<script>
	$(function() {
		$("#btnRegister").click(function() {
			location.href = "/basrak/membership/register";
		});
	});
	function dis() {
		if ($('#displayDiv').css('display') == 'none') {
				$('#displayDiv').show();
		} else {
			$('#displayDiv').hide();
		}
	}
</script>
<c:if test="${empty user.nickname}">
	<div class="container">
		<section id="row">
		
			<form class="form-block" id="login-form" action="/basrak/membership/login" method="post">
				<h1>Login Form</h1>
				<div>
					<input type="text" placeholder="E-mail"  name="email" id="email" autofocus value="${email}"/>
				</div>
				<div>
					<input type="password"  name="passwd"	placeholder="Password">
				</div><br />
				<div>
					<button type="submit" class="member1">로그인</button>
					<button type="button" class="member1" id="btnRegister">회원가입</button>
					<br /> <br />
				</div>
			</form><!-- form -->
		</section><!-- row -->
	</div><!-- container -->
</c:if>		
<c:if test="${!empty user.nickname}">
	<h1 class="main_nickname">${user.nickname} 님! 오늘도 와주셨군요!</h1>
	<h1 class="main_nickname">오늘의 바스락을 확인 해 보세요 :)</h1>
</c:if>
	<!--  회원가입 입력 폼 end. -->
	<br /> <br /> 
	<!--  바스락 클릭 시, 드롭다운으로 보일 부분.  -->
	<div class="form-inline text-center bmFont" id="info">
		<div class="text-center"><button id='show' class="member1" onclick="dis()">바스락!</button></div><br />
		<div class="text-center" style="display:none;" id="displayDiv">
			<span class="emphasis" style="color:rgb(245, 223, 77)">바</span>로보는 &nbsp;
			<span class="emphasis" style="color:rgb(245, 223, 77)">스</span>포츠&nbsp;&nbsp;
			도시<span class="emphasis" style="color:rgb(245, 223, 77)">락</span>!<br /> 
			바스락은 바쁜 현대인들을 위한<br />&nbsp;&nbsp;&nbsp;
			구독형 이메일 스포츠 뉴스레터입니다.<br />
			<br /> 원하는 스포츠를 도시락처럼 담아보세요!<br />
			<br /> 더 재밌고, 더 맛있게<br /> &nbsp;&nbsp;&nbsp;
			여러분의 메일함을 찾아가겠습니다.<br />
			<br /> 매일매일 바스락하세요<br />
		</div>
		<br />
	</div>
	<br />
</div>

