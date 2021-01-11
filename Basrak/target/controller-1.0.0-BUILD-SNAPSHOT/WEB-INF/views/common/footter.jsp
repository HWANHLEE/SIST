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
</style>


<div class="container">
	<div class="row">

		<table class = "footerTable">
			<tr class = "footerTr">
				<td class="footerTd table1" rowspan="3"><img src = "/basrak/images/basrakLogo2.png" class = "logoImages"></td>
				<td class="footerTd">
					<span class="bmFont">학원 위치</span> : 서울특별시 강남수 테헤란로 123(역삼동) 한독약품빌딩 8층 쌍용교육센터
				</td>
				<td class="footerTd table2" rowspan="3">
					<span class="bmFont">전화 번호</span> : 010-****-****
				</td>
			</tr>
			<tr class = "footerTr">
				<td class="footerTd" ><span class="bmFont">관리자</span> : 바스락</td>
			</tr>
			<tr class="footerTr">
				<td class="footerTd"><span class="bmFont">이메일</span> : www.example.com</td>
			</tr>

		</table>

	</div>
</div>


</body>
</html>