<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="../common/header.jsp" />

<link rel="stylesheet" href="/basrak/static/css/bootstrap.css">
<link rel="stylesheet" href="/basrak/static/css/style.css">
<link rel="stylesheet" href="/basrak/static/css/owl.carousel.min.css">
<link rel="stylesheet" href="/basrak/static/css/owl.theme.default.min.css">
<script src="/basrak/static/js/jquery.min.js"></script>
<script src="/basrak/static/js/owl.carousel.min.js"></script>
<script>
	
</script>
<style>
h3 {
	text-align: center;
}

.FAQ {
	margin-left: 450px;
	padding: 10px 25px; /* 버튼 크기 조절. */
	background-color: rgb(20, 107, 69);
	color: white;
	border-radius: 5px;
	border: 0px;
}
.form-inline {
	float : right;
	margin-right : 230px;
	/* text-align: center; */
	background-color: white;
	width: 500px;
	height: 300px;
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
.introduce:first-child{
	margin-top : 140px;	
}
.introduce:nth-child(2){
	margin-top : 30px;
}
body{
	background-color : #fdf1d2;
}
#displayDiv{
	border-left : 1px solid black;
}
.content{
	margin-left : 20px;
	margin-right : 20px;
}
.content1{
	margin-left : 30px;
}
.em{
	font-size: 2em;
	color: rgb(0, 0, 0);
}
</style>





<br />

<br />




<div class="container">
	<div class="row box">

		<h3>바스락</h3>


		<br />
		<div class="form-inline bmFont">

			<div class="form-group introduce"><span class = "content1">바스락이란!</span></div>

			<div class="form-group introduce" id="displayDiv">
				<div class = "content">
					<span class = "em">바</span>로보는 &nbsp;<span class = "em">스</span>포츠 &nbsp;&nbsp;도시<span class = "em">락</span>!<br/>
						바스락은 바쁜 현대인들을 위한<br/>
						 &nbsp;&nbsp;&nbsp;구독형 이메일 스포츠 뉴스레터입니다.<br/><br/>
						원하는 스포츠 종목을 도시락 반찬처럼 담아보세요!<br/><br/>
						더 재밌고, 더 맛있게<br/>
						&nbsp;&nbsp;&nbsp;여러분의 메일함을 찾아가겠습니다.</br/><br/>
						매일매일 바스락하세요<br/>
				</div>
			</div>
			<br />
		</div>
	</div>
</div>

<br />
<br />
<br />
<c:import url="../common/footter.jsp" />    

