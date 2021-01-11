<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../common/header.jsp" />

<c:set var="user" value="${userInfo }" scope="session" />

<link rel="stylesheet" href="/basrak/static/css/bootstrap.css">
<link rel="stylesheet" href="/basrak/static/css/userinfo.css">
<link rel="stylesheet" href="/basrak/static/css/owl.carousel.min.css">
<link rel="stylesheet" href="/basrak/static/css/owl.theme.default.min.css">
<script src="/basrak/static/js/jquery.min.js"></script>
<script src="/basrak/static/js/owl.carousel.min.js"></script>

<script>
	$(function(){
		$('#btnSubmit').on('click', function(){
			location.href = "/basrak/membership/userupdate"
		});

		$('#btnRetry').on('click', function() {
	         location.replace('/basrak/membership/userinfo');
	    });
	    
		$('#btnDelete').on('click', function(){
			if(confirm("정말 탈퇴하시겠습니까 ? ")){
				location.replace("/basrak/membership/delete");
			}else{
				history.go(0);
			}
		}); 
	      
	});
</script>
<br /><br />
<div class="container">
	<div class="row box">
		<h2 class="h2_mypage"> 마이페이지</h2>
		<hr>
			<table class="table_userinfo">
				<caption>내 정보</caption>
				<tr>
					<td>닉네임</td>
					<td><c:out value="${user.nickname}"/></td>
				</tr>
				<tr>
					<td>E-mail</td>
					<td>${user.email }</td>
				</tr>
				<tr>
					<td>바스락할 요일</td>
					<td>${d_seq}</td>
				</tr>
				<tr>
					<td>바스락할 종목</td>
					<td>${s_seq}</td>
				</tr>
			</table>
	</div>
</div>
<div align="center">
	<input type="button"  class ='btnReset'  id ='btnRetry' value="회원 정보">
	<input type="button"  class ='btnUpdate' id ='btnSubmit' value="회원 정보 수정">
	<input type="button"  class ='btnDelete'  id ='btnDelete' value="회원 탈퇴">
</div>
<c:import url="../common/footter.jsp" />    