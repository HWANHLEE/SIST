<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../common/header.jsp" />
<c:set var="user" value="${userInfo }" scope="session" />
<c:set var="day" value="${day }" scope="session" />

<link rel="stylesheet" href="/basrak/static/css/bootstrap.css">
<link rel="stylesheet" href="/basrak/static/css/userupdate.css">
<link rel="stylesheet" href="/basrak/static/css/owl.carousel.min.css">
<link rel="stylesheet" href="/basrak/static/css/owl.theme.default.min.css">
<script src="/basrak/static/js/jquery.min.js"></script>
<script src="/basrak/static/js/owl.carousel.min.js"></script>

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
</script>

<div class="container">
	<div class="row">
	<h2 class="h2_mypage">마이페이지</h2>
		<hr>
		<form action="/basrak/membership/userupdate" method="post">
     		<input type="hidden" value="${user.nickname}" name="nickname">
     			
         <!-- 바스락 받을 요일 -->
         <br />
      			<table class="table_userupdate">
	      			<caption class="text-left">내 정보 수정하기</caption>
	      			<tr>
	      			<th class="subject">항목</th>
	      			<th colspan="5" class="bmFont text-center ">선택</th>
	      			</tr>
		         <!-- 바스락 받을 요일 -->
		         <tr>
		         	<td class="bmFont">바스락 할 요일</td>
		            <td><input type="checkbox" name="day" id="mon" value="1" checked>월&nbsp;&nbsp;</td>
		            <td><input type="checkbox" name="day" id="tue" value="2">화&nbsp;&nbsp;</td>
		            <td><input type="checkbox" name="day" id="wed" value="3">수&nbsp;&nbsp;</td>
		            <td><input type="checkbox" name="day" id="thu" value="4">목&nbsp;&nbsp;</td>
		            <td><input type="checkbox" name="day" id="fri" value="5">금&nbsp;&nbsp;</td>
		          </tr>
		         <!-- 바스락 받을 종류 -->
		         <tr>
		         	<td>바스락 할 종목</td>
		             <td><input type="checkbox" name="sports" id="soccer" value="1" checked>축구&nbsp;&nbsp;</td>
		             <td><input type="checkbox" name="sports" id="baseball" value="2">야구&nbsp;&nbsp;</td>
		             <td><input type="checkbox" name="sports" id="basketball" value="3">농구&nbsp;&nbsp;</td>
		             <td><input type="checkbox" name="sports" id="volleyball" value="4">배구&nbsp;&nbsp;</td>
		             <td><input type="checkbox" name="sports" id="liban" value="5">일반&nbsp;&nbsp;</td>
		           </tr>
	            </table>
      		 	<input type="submit" class="btnUpdate" id='btnUpdate' value="수정하기">
		</form>
	</div>
</div>
<c:import url="../common/footter.jsp" />    
