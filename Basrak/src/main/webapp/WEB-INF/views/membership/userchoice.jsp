<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../common/header.jsp" />

<link rel="stylesheet" href="/basrak/static/css/bootstrap.css">
<link rel="stylesheet" href="/basrak/static/css/userchoice.css">
<title>회원 정보 등록</title>
</head>
<body>
	<br />
	<div class="container">
		<div class="row">
			<h2 class="h2_userchoice">회원 정보 등록</h2>
			<hr>
				<form action="/basrak/membership/userchoice" method="post">
					<!-- 닉네임을 숨겨서 받아간다. -->
					<input type="hidden" value="${nickname}" name="nickname">
					<table class="table_userchoice">
						<caption class="text-left">바스락 선택하기</caption>
						<tr>
							<th class="subject">항목</th>
							<th colspan="5" class="bmFont text-center ">선택</th>
						</tr>
						<!-- 바스락 받을 요일 -->
						<tr>
							<td>바스락 할 요일</td>
							<td><input type="checkbox" name="day" id="mon" value="1"
								checked>월&nbsp;&nbsp;</td>
							<td><input type="checkbox" name="day" id="tue" value="2">화&nbsp;&nbsp;</td>
							<td><input type="checkbox" name="day" id="wed" value="3">수&nbsp;&nbsp;</td>
							<td><input type="checkbox" name="day" id="thu" value="4">목&nbsp;&nbsp;</td>
							<td><input type="checkbox" name="day" id="fri" value="5">금&nbsp;&nbsp;</td>
						</tr>
						<!-- 바스락 받을 종류 -->
						<tr>
							<td>바스락 할 종목</td>
							<td><input type="checkbox" name="sports" id="soccer"	 value="1" checked>축구&nbsp;&nbsp;</td>
							<td><input type="checkbox" name="sports" id="baseball" value="2">야구&nbsp;&nbsp;</td>
							<td><input type="checkbox" name="sports" id="basketball" value="3">농구&nbsp;&nbsp;</td>
							<td><input type="checkbox" name="sports" id="volleyball" value="4">배구&nbsp;&nbsp;</td>
							<td><input type="checkbox" name="sports" id="liban" value="5">일반&nbsp;&nbsp;</td>
						</tr>
					</table>
					<input type="submit" class="btnSubmit" id='btnSubmit' value="가입하기">
				</form>
			</div>
		</div>
</body>
</html>
<c:import url="../common/footter.jsp" />