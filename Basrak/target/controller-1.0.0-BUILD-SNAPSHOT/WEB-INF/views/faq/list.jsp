<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../common/header.jsp" />
<c:set var="pageSize" value="${pageSize }" />
<c:set var="currentPage" value="${currentPage }" />
<c:set var="totalPage" value="${totalPage }" />

<link rel="stylesheet" href="/basrak/static/css/bootstrap.css">
<link rel="stylesheet" href="/basrak/static/css/style.css">
<link rel="stylesheet" href="/basrak/static/css/owl.carousel.min.css">
<link rel="stylesheet" href="/basrak/static/css/owl.theme.default.min.css">
<script src="/basrak/static/js/jquery.min.js"></script>
<script src="/basrak/static/js/owl.carousel.min.js"></script>

<script>
$(document).ready(function() {
    $('.owl-carousel').owlCarousel({
         loop : true,
         margin : 0,
         nav : true,
         responsive : {
            0 : {
               items : 1
            },
            200 : {
               items : 3
            },
            1000 : {
               items : 5
            }
         }
      })
   });
</script>   
<style>
   .col-md-3{
      float : right;
   }
   .box{
      width : 210px;
      margin: auto;
   }
   .item{
      margin-left: 26px;
   }
   h3{
      text-align : center;
   }
   .table{
      width : 700px;
      margin : auto;
   }
   .tr{
      background-color : #fdf1d2;
   }
   body{
         background-color : #fdf1d2;
   }
   .search{
      width : 250px;
   }
   .col-md-3{
      margin-right : 200px;
   }
</style>

<div class="col-md-3">
   <div class="input-group search">
      <input type="text" class="form-control" placeholder="게시물 검색">
      <span class="input-group-btn">
         <button type="submit" class="btn btn-default">
            <span class="glyphicon glyphicon-search"></span>
         </button>
      </span>
   </div>
</div>
<br/>
<br/>
<br/>
<table class="table talbe-non" style="border-width:0px">
   <tr>
      <td class="text-right">(${currentPage }/${totalPage}) page</td>
   </tr>
</table>

<!-- 게시판 -->
<h3>글 목록</h3>
<table class = "table">
   <thead>
      <tr class = "tr">
         <th>No.</th>
         <th>제목</th>
         <th>작성날짜</th>
         <th>조회수</th>
      </tr>
   </thead>
   <tbody>
      <c:if test="${faqlist.size() == 0 }">
         <tr>
            <td colspan="5" class="text-center">No Data</td>
         </tr>
      </c:if>
      <c:if test="${faqlist.size() >0 }">
         <c:set var="begin" value="${(currentPage-1) * pageSize }" />
         <c:set var="end" value="${begin + pageSize - 1 }" />
         <c:forEach items="${faqlist}" var="faq" begin="${begin }" end="${end }">
            <tr>
               <td>${faq.f_seq}</td>
               <td>
                  <a href="/basrak/faq/read?f_seq=${faq.f_seq }">${faq.title }</a>
               </td>
               <td>${faq.writedate }</td>
               <td>${faq.readnum }</td>
            </tr>
         </c:forEach>
      </c:if>
   </tbody>
</table>

   <div class = "container">
      <div class = "row box">
         <c:if test="${currentPage ne 1}">
            [<a href="/basrak/faq/list?page=${currentPage - 1 }">이전</a>]&nbsp;&nbsp;&nbsp;
         </c:if>
         <c:if test="${currentPage eq 1}">
            [이전]&nbsp;&nbsp;&nbsp;
         </c:if>
         <c:forEach begin="1" end="${totalPage }" var="i" >
            <c:if test="${currentPage eq i}">
               <span style="color:red; font-size:1.5em; font-weight">${i }</span>&nbsp;&nbsp;&nbsp;
            </c:if>
            <c:if test="${currentPage ne i }">
               <a href="/basrak/faq/list?page=${i}">${i}</a>&nbsp;&nbsp;&nbsp;
            </c:if>
         </c:forEach>
         <c:if test="${currentPage ne totalPage}">
            [<a href="/basrak/faq/list?page=${currentPage + 1 }">다음</a>]&nbsp;&nbsp;&nbsp;
         </c:if>
         <c:if test="${currentPage eq totalPage}">
            [다음]&nbsp;&nbsp;&nbsp;
         </c:if>
      </div>
   </div>
<br />
<br />   
            
<c:import url="../common/footter.jsp" />    
    