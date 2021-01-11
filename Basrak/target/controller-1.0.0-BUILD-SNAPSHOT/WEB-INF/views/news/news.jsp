<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="../common/header.jsp" />
<%--CheckList 
* <c:forEach>에 변수 2개인거...? (-)
* 축야농배일(-)
* 이미지 기사 이미지 가져오기(-)
* 페이징처리..?굳이..? 일단 20개씩 가져오는걸로! 20개 이상은 안되는거 같음
--%>
<link rel="stylesheet" href="/basrak/static/css/bootstrap.css">
<link rel="stylesheet" href="/basrak/static/css/style.css">
<link rel="stylesheet" href="/basrak/static/css/owl.carousel.min.css">
<link rel="stylesheet" href="/basrak/static/css/owl.theme.default.min.css">
<script src="/basrak/static/js/jquery.min.js"></script>
<script src="/basrak/static/js/owl.carousel.min.js"></script>
<style>
/* 
    .row{
        margin-top: 20px; 
    }
     */
/*      
    .container {
        overflow: hidden;
        max-width: 100%;
        height: auto;
        display: block;
    } 
    */
    .mimg {
        max-width: 100%;
        height: auto;
    }
    .timg {
        width: 100%;
        height: 100%;
    }
    body{
    	background-color : #fdf1d2;
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
   <c:otherwise>
      <c:set var="sports" value="일반" />
   </c:otherwise>
</c:choose>
<body>
<h3 class="text-center">바스락 ${sports }</h3>
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
<c:import url="../common/footter.jsp" />    