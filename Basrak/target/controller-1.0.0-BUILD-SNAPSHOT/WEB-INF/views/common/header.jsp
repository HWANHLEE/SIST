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
<link rel="stylesheet" href="/basrak/static/css/bootstrap.css">
<link rel="stylesheet" href="/basrak/static/css/bootstrap-theme.css">
<script src="/basrak/static/js/jquery-3.5.1.js"></script>


<!--  재우! -->
<!-- <link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">
<script src="js/jquery-3.5.1.js"></script> -->


<!-- header CSS -->
<style>
    /* 배민 한나체 Air를 사용하기 위한  font family*/
   @font-face {
      font-family: 'BMHANNAAir';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff');
      font-weight: normal;
      font-style: normal;
   }
   /*배민 한나체 Air*/
   .bmFont{
      font-family: 'BMHANNAAir';
      width : 100px;
   }
   ul {
         margin-left : 250px;
       /*   margin-left: 100px; */
   }
   /* li태그 수평으로. */
   li {
      margin: 30px; /* li태그 간의 간격. */
      display: inline-block;
   }
   li:last-child {
      margin-left: 100px;
   }
   #outHeader{
         width : 2000px;
   }
   #inHeader{
         width : 2000px;
         height : 57px;
   }
   .header{
      /*background-color: #006400; */
      background-color: rgb(20, 107, 69);
      height : 100px;
      width : 100%;
   }
   .a{
      color: white;
      margin-top: 0px;
   }
   .logoImages{
      width : 50px;
      height : 50px;
   }
   .bmFont {
      width : 70px;
      height : 50px;
   }
   #headerLi{
         margin-top : 0px;
         margin-left : 10px;
   }
   #btnLogin, #btnLogout, #btnMyInfo{
      width : 150px;
      padding : 10px 25px;      /* 버튼 크기 조절. */
     background-color: rgb(20, 107, 69);
     color : white;
     border-radius: 5px;
     border : 0px;
   }
</style>

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
      
   });
</script>
</head>
<body>
<div class="container" id = "outHeader">
      <div class="row header"  id = "inHeader">
         <ul>
            <li class="bmFont" id = "headerLi"><a href="/basrak" class = "a"><img src = "/basrak/images/basrakLogo2.png" class = "logoImages"></a></li>
            <li class="bmFont" id = "headerLi"><a href="/basrak/basrak/basrak">바스락</a></li>
            <li class="bmFont" id = "headerLi"><a href="/basrak/news/news"  class = "a">기사 보기</a></li>
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