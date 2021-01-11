<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="user" value="${userInfo}" />

<link rel = "stylesheet" href = "/basrak/static/css/bootstrap.css">
<link rel = "stylesheet"  href = "/basrak/static/css/style.css">
<script src="/basrak/static/js/jquery.min.js"></script>
<script src="/basrak/static/js/jquery-3.5.1.js"></script>

<!-- logimForm1 CSS-->
<style>
.form-block {
	background-color:#fdf1d2;
	height: 220px;
	width: 400px;
	text-align: center;
	/* margin-left: auto;
            margin-right: auto; */
	margin: 0px auto; /* 가운데 정렬. */
	border-radius: 25px;
	margin-top: 50px;
}

.form-group {
	width: 350px;
	margin: 0px auto;
}

.btn-primary {
	margin-bottom: 5px;
}

.form-control {
	margin-top: 5px;
}

img {
	width: 30px;
	height: 30px;
	/* display: block; */
}
.member1{
	width : 100px;
	background-color: rgb(20, 107, 69);
	color : white;
	border-radius: 5px;
	border : 0px;
}
.member2{
	width : 250px;
	background-color: rgb(20, 107, 69);
	color : white;
	border-radius: 5px;
	border : 0px;
}
.emphasis{
	font-size: 2em;
	color: rgb(0, 0, 0);
}
.form-inline {
	margin: 0px auto;
	/* text-align: center; */
	background-color: #ffefd5;
	width: 500px;
	height: 250px;
	border-radius: 25px;
	
}

.form-inline .form-group:first-child {
	width : 120px;
	margin-left: 50px;
	float : left;
}

.form-inline .form-group:nth-child(2) {
	width : 280px;
	margin-left: 50px;
	float : left;
}
body{
   	background-color : #fdf1d2;
}

</style>

<div class="panel-body">
   	<!--  회원가입 입력 폼. -->
   	<c:if test="${empty user.nickname}">
		<form class="form-block" id="login-form" action="/basrak/membership/login" method="post">
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon">
						<img src="/basrak/images/user.png" alt="User Images">
					</div>
					<!-- 이메일 입력 -->
					<input type="text" class="form-control" name="email" id="email" placeholder="email" autofocus value="${email}">
				</div>
				<br />
				<div class="input-group">
					<div class="input-group-addon">
						<img src="images/key.png" alt="Key Images">
					</div>
					<!-- 비밀번호 입력 -->
					<input type="password" class="form-control" name="passwd" placeholder="Password">
				</div>
				<br />
					<button type="submit" class="member1">로그인</button>  &nbsp;&nbsp;&nbsp;
				
					<button type = "submit" class = "member1" id = "register">회원가입</button>
				<br />
				<br/>
				<button type="submit" class="member2" id = "memership">회원으로 이용하고 싶으시다면 클릭</button>
			</div>
		</form>
	</c:if>
	<!--  회원가입 입력 폼 end. -->
	<!--  바스락 클릭 시, 드롭다운으로 보일 부분.  -->
<div class="form-inline bmFont">
	<div class="form-group">
		바스락이 뭔가요 ?
	</div>
	<div class="form-group" id = "displayDiv">
		<span class = "emphasis">바</span>로보는 &nbsp;<span class = "emphasis">스</span>포츠 &nbsp;&nbsp;도시<span class = "emphasis">락</span>!<br/>
		바스락은 바쁜 현대인들을 위한<br/>
		 &nbsp;&nbsp;&nbsp;구독형 이메일 스포츠 뉴스레터입니다.<br/><br/>
		원하는 스포츠 종목을 도시락 반찬처럼 담아보세요!<br/><br/>
		더 재밌고, 더 맛있게<br/>
		&nbsp;&nbsp;&nbsp;여러분의 메일함을 찾아가겠습니다.<br/><br/>
		매일매일 바스락하세요<br/>
	</div>
	<br />
</div>
<br/>
</div>
<script>
$(function(){
	//회원가입 버튼 클릭 시,
	$('#register').on('click', function(){
		location.href = "/Project/page_register.jsp";
	});
	
	//회원으로 이용하고 싶다면 클릭 시,
	$('#membership').on('click', function(){
		location.href = "/Project/page_login.jsp";
	});
});
</script>

