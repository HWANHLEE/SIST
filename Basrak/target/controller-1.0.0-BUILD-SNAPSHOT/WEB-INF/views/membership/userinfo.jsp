<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../common/header.jsp" />

<c:set var="user" value="${userInfo }" scope="session" />

<link rel="stylesheet" href="/basrak/static/css/bootstrap.css">
<link rel="stylesheet" href="/basrak/static/css/style.css">
<link rel="stylesheet" href="/basrak/static/css/owl.carousel.min.css">
<link rel="stylesheet" href="/basrak/static/css/owl.theme.default.min.css">
<script src="/basrak/static/js/jquery.min.js"></script>
<script src="/basrak/static/js/owl.carousel.min.js"></script>
<script>
</script>
<style>
/* 배민 폰트를 사용하기 위한 1단계 */
@font-face {
	font-family: 'BMHANNAAir';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
/*배민 폰트를 사용하기 위한 2단계 */
.bmFont {
	font-family: 'BMHANNAAir';
}

/* 가장 바깥 상자 */
.main {
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -100px;
	margin-left: -512px;
	background-color: rgb(224, 225, 226);
	width: 1000px;
	height: 200px;
}

.main_1 {
	/* display: inline-block; */
	border: 1px solid black;
	/* width : 200px; */
	height: 200px;
	float: left;
	width: 15%;
}

.main_2 {
	/* display: inline-block; */
	border: 1px solid black;
	height: 200px;
	/* width : 350px; */
	float: left;
	width: 39%;
}

.main_3 {
	/* display: inline-block; */
	border: 1px solid black;
	height: 200px;
	/* width : 150px; */
	float: left;
	width: 15%;
}

.main_4 {
	/* display: inline-block; */
	border: 1px solid black;
	height: 200px;
	/* width : 150px; */
	float: left;
	width: 15%;
}

.main_5 {
	/* display: inline-block; */
	border: 1px solid black;
	height: 200px;
	/* width : 150px; */
	float: left;
	width: 15%;
}

/* 상자 안의 글자 부분  */
.content {
	/* display : table-cell; */
	vertical-align: middle;
	text-align: center;
}
.btnUpdate, .btnReset, .btnCancel{
	margin-top : 10px;
	padding : 10px 25px;		/* 버튼 크기 조절. */
	background-color: rgb(20, 107, 69);
	color : white;
	border-radius: 5px;
	border : 0px;
}
body{
	background-color : #fdf1d2;
}
.myInfoTable{
	margin : 0px auto;
	background-color : white;
	width : 700px;
}
.myInfoH2{
	text-align : center;
}
</style>
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
<br />
<div align="center">
	<input type="button"  class ='btnReset'  id ='btnRetry' value="회원 정보">
	<input type="button"  class ='btnUpdate' id ='btnSubmit' value="회원 정보 수정">
	<input type="button"  class ='btnDelete'  id ='btnDelete' value="회원 탈퇴">
</div>

<br />
<div class="container">
	<div class="row box">
		<h3>내 정보</h3>
		<ul>
			<li>닉네임 : 
				<span id = "nickname">
					<c:out value="${user.nickname}"/>
				</span>
			</li><br />
			<li>email : 
				<span id = "email">
					${user.email }
				</span>
			</li><br />
			<li>바스락할 요일 : 
				<span id = "receiveDay">
					${d_seq }
				</span>
			</li><br /><br />
			<li>바스락할 종목 :
				<span id = "receiveSport">
					${s_seq}
				</span>
			</li>
		</ul>
		<hr>
	</div>
</div>

<c:import url="../common/footter.jsp" />    