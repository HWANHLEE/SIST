<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="user" value="${userInfo}" />
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Basrak</title>
<!--  환희! -->

<!-- <link rel="stylesheet" href="/basrak/static/css/bootstrap-theme.css"> -->
<link rel="stylesheet" href="/basrak/static/css/header.css">
<link rel="stylesheet" href="/basrak/static/css/bootstrap.css">
<script src="/basrak/static/js/jquery-3.5.1.js"></script>
<!-- 희진님한테 받은 코드 -->
<script>
   $(function() {
      
      $("#btnRegister").click(function() {
         location.href = "/basrak/membership/register";
      });
      
       $('#btnLogin').on('click', function() {
         location.href = "/basrak/membership/login";
      });
       
       $('#btnLogout').on('click', function() {
         if (confirm("정말 로그아웃하시겠습니까 ? ")) {
            location.replace("/basrak/membership/logout");
         } else {
            history.go(0);
         }
      });
       
      $('#btnMyInfo').on('click', function() {
         location.replace('/basrak/membership/userinfo');
      }); 
      
      $('#clickBasrak').on('click', function(){
        $('#divIntroduce').show();
     });
      
      $('#news').mouseover( function(){
      	if ($('#nav_sports').css('display') == 'none') {
      			$('#nav_sports').show();
      	} else {
      		$('#nav_sports').hide();
      		}
      	});
   });
</script>
</head>
<body>
<div class="container" id = "outHeader">
      <div class="row header"  id = "inHeader">
         <ul>
            <li class="bmFont" id = "headerLi"><a href="/basrak" class = "a"><img src = "/basrak/images/basrakLogo2_Illuminating.png" class = "logoImages"></a></li>
            <li class="bmFont" id = "headerLi"><a href="/basrak/basrak/basrak">바스락</a></li>
            <li class="bmFont" id = "headerLi"><a href="/basrak/news/news"  class = "a" id="news">기사 보기</a></li>
            <li class="bmFont" id = "headerLi"><a href="/basrak/vvs/list?page=1"  class = "a">커뮤니티</a></li>
            <li class="bmFont" id = "headerLi"><a href="/basrak/faq/list?page=1"  class = "a">문의하기</a></li>

            <c:if test="${empty user.nickname}">
               <li class="bmFont" id = "headerLi"><button id="btnLogin" >로그인</button></li>
            </c:if> 
            <c:if test="${not empty user.nickname}">
               <li class="bmFont" id = "headerLi"><button id="btnMyInfo">마이페이지</button></li>
               <li class="bmFont" id = "headerLi"><button id="btnLogout" >Log Out</button></li>
            </c:if>
         </ul>
      </div>
   </div>
   <!-- '기사보기' 마우스오버 할 때, 종목 네비게이션 바 내려옴(내려온 후 다시 마우스오버하면 사라짐) -->
   <div class="container" style="display:none;"   id = "nav_sports" >
      <div class="row header1"  id = "inHeader1">
	      <div class="hover_effect_6 caption_title"id="">
	         <ul>
	            <li class="bmFont" id = "headerLi"><a href="/basrak/news/getsoccer" class = "mouseOver" >축구</a></li>
	            <li class="bmFont" id = "headerLi"><a href="/basrak/news/getbaseball"  class = "mouseOver" >야구</a></li>
	            <li class="bmFont" id = "headerLi"><a href="/basrak/news/getbasketball"  class = "mouseOver">농구</a></li>
	            <li class="bmFont" id = "headerLi"><a href="/basrak/news/getvolleyball"  class = "mouseOver">배구</a></li>
	            <li class="bmFont" id = "headerLi"><a href="/basrak/news/getliban"  class = "mouseOver">일반</a></li>
	         </ul>
         </div>
      </div>
   </div>