<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 등록</title>
</head>
<body>
<h1 class="text-center">회원 정보 등록</h1>
<div class="container">
   <div class="row">
      <div class="form-horizontal" >
      <form action="/basrak/membership/userchoice" method="post">
      		<!-- 닉네임을 숨겨서 받아간다. -->
      			<input type="hidden" value="${nickname}" name="nickname">
	         <!-- 바스락 받을 요일 -->
	            <input type="checkbox" name="day" id="mon" value="1" checked>월&nbsp;&nbsp;
	            <input type="checkbox" name="day" id="tue" value="2">화&nbsp;&nbsp;
	            <input type="checkbox" name="day" id="wed" value="3">수&nbsp;&nbsp;
	            <input type="checkbox" name="day" id="thu" value="4">목&nbsp;&nbsp;
	            <input type="checkbox" name="day" id="fri" value="5">금&nbsp;&nbsp;
	         <!-- 바스락 받을 종류 -->
	            <input type="checkbox" name="sports" id="soccer" value="1" checked>축구&nbsp;&nbsp;
	            <input type="checkbox" name="sports" id="baseball" value="2">야구&nbsp;&nbsp;
	            <input type="checkbox" name="sports" id="basketball" value="3">농구&nbsp;&nbsp;
	            <input type="checkbox" name="sports" id="volleyball" value="4">배구&nbsp;&nbsp;
	            <input type="checkbox" name="sports" id="liban" value="5">일반&nbsp;&nbsp;
	         <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <input type="submit" class="btn btn-success" id='btnSubmit' value="가입하기">
                </div>
	           </div>
           </form>
      </div>
   </div>
</div>
</body>
</html>
<c:import url="../common/footer.jsp" />