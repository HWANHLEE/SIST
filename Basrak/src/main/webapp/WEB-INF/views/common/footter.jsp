<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%-- 위에 header에서 이미 <html>, <body> 열엇음. --%>

<%-- footer.html에서 안가져온 부분. --%>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->

<%-- footer.css --%>
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
body{
	padding-bottom: 70px; 
}

.footerTable {
	border-radius: 25px;
	padding: 5px;
	margin : 0px auto;
}

.table1 {
	/* border-right-style: 1px solid black; */
	border-right: 1px solid;
	border-right-color: black;
}

.table2 {
	border-left: 1px solid;
	border-left-style: black;
}
.footer {

    position: absolute;

    left: 0;

    bottom: 0;

    width: 100%;

	padding: 10px 0;

	text-align: center;

	color: white;

	background-color: rgb(147, 149, 151);
	
}

</style>

<nav class="navbar navbar-default navbar-fixed-bottom">
	<div class="container">
		<div class="row">
			<div class="footer" style="display: inline-block;">
				<div style="display: inline-block; margin-right:100px">
					<img src="/basrak/images/basrakLogo_text_Illuminating.png" style="width: 160px; height: 70px;" class="logoImages"><br/>
					<span>바스락은</span><br />
					<span>힙, 재미, 편리함을 추구합니다.</span><br />
				</div>	
				<div style="display: inline-block;">
					<span> ㈜바스락 / 대표: 이환희 / 사업자등록번호: 123-45-67890 / 대표전화: 02-3482-4636 / </span><br />
					<span> 통신판매번호: 2020-서울역삼-1234 / 개인정보보호책임자: 김희진 / 담당자메일주소: whatsup@basrak.com /</span><br />
					<span> 서울특별시 강남구 테헤란로 123(역삼동) 한독약품빌딩 8층 쌍용교육센터</span><br />
					<span> Copyright (C) Basrak Corporation. , All Right Reserved</span>
				</div>
			</div>
		</div>
	</div>
</nav>
</body>
</html>