<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="../common/header.jsp" />
<%--CheckList 
* <c:forEach>에 변수 2개인거...? (-)
* 축야농배일(-)
* 이미지 기사 이미지 가져오기(-)
* 페이징처리..?굳이..? 일단 20개씩 가져오는걸로! 20개 이상은 안되는거 같음
--%>
<link rel="stylesheet" href="/basrak/static/css/bootstrap.css">
 <link rel="stylesheet" href="/basrak/static/css/news.css"> 
<link rel="stylesheet" href="/basrak/static/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="/basrak/static/css/owl.theme.default.min.css">
<script src="/basrak/static/js/jquery.min.js"></script>
<script src="/basrak/static/js/owl.carousel.min.js"></script>
<style>
	hr{
	width : 170px;
	border: 1px solid rgb(245, 223, 77);
}
	.em{
		font-size : 2em;
	}
</style>

<c:choose>
	<c:when test="${selectedNews == 'soccer'}">
		<c:set var="sports" value="축구" />
	</c:when>
	<c:when test="${selectedNews == 'baseball'}">
		<c:set var="sports" value="야구" />
	</c:when>
	<c:when test="${selectedNews == 'basketball'}">
		<c:set var="sports" value="농구" />
	</c:when>
	<c:when test="${selectedNews == 'volleyball'}">
		<c:set var="sports" value="배구" />
	</c:when>
	<c:when test="${selectedNews == 'ilban'}">
		<c:set var="sports" value="일반" />
	</c:when>
	<c:otherwise>
		<c:set var="sports" value="종합" />
	</c:otherwise>
</c:choose>
<br>

<h3 class="text-center"  style="color:rgb(245, 223, 77);">바스락 <span class="em">${sports }</span></h3>
<hr>
<br>
<br>
<h3 class="text-center" style="color:rgb(245, 223, 77);">주요뉴스</h3><br/>
<table border="0" align="center" width="70%">
	<c:if test="${titles[status.index]!='' }">
		<tr>
			<td align="center"><a href="${links[3]}">${images[3]}</a></td>
			<td>&nbsp;&nbsp;&nbsp;</td>
			<td align="center"><a href="${links[4]}">${images[4]}</a></td>
			<td>&nbsp;&nbsp;&nbsp;</td>
			<td align="center"><a href="${links[5]}">${images[5]}</a></td>
			<td>&nbsp;&nbsp;&nbsp;</td>
			<td align="center"><a href="${links[6]}">${images[6]}</a></td>
		</tr>
		<tr>
			<td align="center"><a href="${links[3]}">${titles[3]}</a></td>
			<td>&nbsp;&nbsp;&nbsp;</td>
			<td align="center"><a href="${links[4]}">${titles[4]}</a></td>
			<td>&nbsp;&nbsp;&nbsp;</td>
			<td align="center"><a href="${links[5]}">${titles[5]}</a></td>
			<td>&nbsp;&nbsp;&nbsp;</td>
			<td align="center"><a href="${links[6]}">${titles[6]}</a></td>
		</tr>
		<tr>
			<td align="center"><a href="${links[7]}">${images[7]}</a></td>
			<td>&nbsp;&nbsp;&nbsp;</td>
			<td align="center"><a href="${links[8]}">${images[8]}</a></td>
			<td>&nbsp;&nbsp;&nbsp;</td>
			<td align="center"><a href="${links[9]}">${images[9]}</a></td>
			<td>&nbsp;&nbsp;&nbsp;</td>
			<td align="center"><a href="${links[10]}">${images[10]}</a></td>
		</tr>
		<tr>
			<td align="center"><a href="${links[7]}">${titles[7]}</a></td>
			<td>&nbsp;&nbsp;&nbsp;</td>
			<td align="center"><a href="${links[8]}">${titles[8]}</a></td>
			<td>&nbsp;&nbsp;&nbsp;</td>
			<td align="center"><a href="${links[9]}">${titles[9]}</a></td>
			<td>&nbsp;&nbsp;&nbsp;</td>
			<td align="center"><a href="${links[10]}">${titles[10]}</a></td>
		</tr>
	</c:if>
</table>
<br>

<h3 class="text-center"  style="color:rgb(245, 223, 77);">추천뉴스</h3>
<table border="0" align="center" width="60%">
	<c:forEach var="link" items="${links }" varStatus="status" begin="11"
		end="22">
		<c:if test="${titles[status.index]!='' }">

			<tr>
				<td align="center"><a href="${link}">${images[status.index]}</a></td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td><a href="${link}"><h4>${titles[status.index]}</h4></a> <a
					href="${link}"><c:choose>
							<c:when test="${fn:length(descriptions[status.index]) gt 200}">
								<c:out
									value="${fn:substring(descriptions[status.index],0,199) }.....">
								</c:out>
							</c:when>
							<c:otherwise>
								<c:out value="${descriptions[status.index] }"></c:out>
							</c:otherwise>
						</c:choose> </a></td>
			</tr>
		</c:if>
	</c:forEach>
</table>

<!-- 은지수정 -->
<%--  
   <div class="container">
      <!-- 검색바 -->
      <div class="row">
         <br />
         <!-- 헤드라인 뉴스 -->
   <c:forEach var="link" items="${links }" varStatus="status" begin="3" end="22">
           <c:if test="${titles[status.index]!='' }">
             <div class="row">
                 <div class="col-md-3"></div>
                 <div class="col-md-6">
                     <a href="${link}">${images[status.index]}</a>
                 </div>
             </div>
             
             <div class="row">
                 <div class="col-md-3"></div>
                 <div class="col-md-6">
                     <h4><strong><a href="${link}">${titles[status.index]}</a></strong></h4>
                 </div>
             </div>
        </c:if>
      </c:forEach>
   </div>
   </div>
   --%>

<c:import url="../common/footter.jsp" />