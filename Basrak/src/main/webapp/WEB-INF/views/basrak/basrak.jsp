<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="../common/header.jsp" />

<link rel="stylesheet" href="/basrak/static/css/bootstrap.css">
<link rel="stylesheet" href="/basrak/static/css/basrak.css">
<link rel="stylesheet" href="/basrak/static/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="/basrak/static/css/owl.theme.default.min.css">
<script src="/basrak/static/js/jquery.min.js"></script>
<script src="/basrak/static/js/owl.carousel.min.js"></script>

<br />
<br />
<form>
	<h2>
		<span class="em">바</span><span class="white">로 보는</span> &nbsp; <span
			class="em">스</span><span class="white">포츠&nbsp;&nbsp;도시</span> <span
			class="em">락</span> !<br />
	</h2>
	<hr>

	<div class="basrak_em">
		<span class="basrak">바스락</span>은 바쁜 현대인들을 위한<br />&nbsp;&nbsp;&nbsp;
		구독형 이메일 스포츠 뉴스레터입니다.<br /> <br /> 원하는 스포츠를 도시락처럼 담아보세요!<br /> <br />
		더 재밌고, 더 맛있게<br /> &nbsp;&nbsp;&nbsp; 여러분의 메일함을 찾아가겠습니다.<br /> <br />
		매일 매일 <span class="basrak">바스락</span>하세요.<br /> <br />
	</div>
	<div class="container">
		<div class="row">
			<div class="new_title">
				<ul>
					<li><strong>공지사항</strong></li>
					<li><a href="/basrak/faq/list?page=1"> <!-- faq게시판리스트 -->
							<img src="/basrak/images/cat.png" width="120px" height="100px"> <!-- 더보기이미지 일단 아무거나 -->
					</a></li>
				</ul>
				<ul>
					<br />
					<br />
				</ul>
			</div>
		</div>
	</div>
</form>
<c:import url="../common/footter.jsp" />

