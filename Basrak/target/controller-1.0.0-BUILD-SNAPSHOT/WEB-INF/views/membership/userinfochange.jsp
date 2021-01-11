<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../common/header.jsp" />
<c:set var="user" value="${userInfo }" scope="session" />
<c:set var="day" value="${day }" scope="session" />

<link rel="stylesheet" href="/basrak/static/css/bootstrap.css">
<link rel="stylesheet" href="/basrak/static/css/style.css">
<link rel="stylesheet" href="/basrak/static/css/owl.carousel.min.css">
<link rel="stylesheet" href="/basrak/static/css/owl.theme.default.min.css">
<script src="/basrak/static/js/jquery.min.js"></script>
<script src="/basrak/static/js/owl.carousel.min.js"></script>
<style>
	.row{
		padding:10px 300px;
	}
</style>
<script src="/basrak/static/js/jquery-3.5.1.js"></script>
<script>
	var maxChecked = 3;   //선택가능한 체크박스 갯수
	var totalChecked = 0; // 설정 끝

	function CountChecked(field) {
		if (field.checked)
			totalChecked += 1;
		else
			totalChecked -= 1;
	
		if (totalChecked > maxChecked) {
			alert ("최대"+maxChecked+"개 까지만 가능합니다.");
			field.checked = false;
			totalChecked -= 1;
		}
			
	}
	function ResetCount(){
		totalChecked = 0;
	}
	$(function(){
		$('#btnUpdate').click(function(){
			location.href = "/basrak";
		});
	});
</script>
<div class="container">
	<div class="row">
		<form action="/basrak/membership/userchoice" method="post">
     		<!-- 닉네임을 숨겨서 받아간다. -->
     			<input type="hidden" value="${nickname}" name="nickname">
         <!-- 바스락 받을 요일 -->
         	<h6>바스락 받을 요일</h6>
            <input type="checkbox" name="day" id="mon" value="1">월&nbsp;&nbsp;
            <input type="checkbox" name="day" id="tue" value="2">화&nbsp;&nbsp;
            <input type="checkbox" name="day" id="wed" value="3">수&nbsp;&nbsp;
            <input type="checkbox" name="day" id="thu" value="4">목&nbsp;&nbsp;
            <input type="checkbox" name="day" id="fri" value="5">금&nbsp;&nbsp;<br /><br />
         <!-- 바스락 받을 종류 -->
         	<h6>바스락 받을 종류</h6>
            <input type="checkbox" name="sports" id="soccer" value="1">축구&nbsp;&nbsp;
            <input type="checkbox" name="sports" id="baseball" value="2">야구&nbsp;&nbsp;
            <input type="checkbox" name="sports" id="basketball" value="3">농구&nbsp;&nbsp;
            <input type="checkbox" name="sports" id="volleyball" value="4">배구&nbsp;&nbsp;
            <input type="checkbox" name="sports" id="liban" value="5">일반&nbsp;&nbsp;
	        <div class="form-group">
	        	<div class="col-sm-offset-2 col-sm-10">
      		 			<input type="submit" class="btn btn-success" id='btnUpdate' value="수정하기">
	       		</div>
             </div>
		</form>
	</div>
</div>
<c:import url="../common/footter.jsp" />    






