<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="../common/header.jsp"/>

<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>  <!-- 위지윅 에디터 쓰기위해 -->
  <h1 class="text-center">Faq 글 수정하기</h1>
  <div class="container">
    <div class="row">
      <form class="form-horizontal" action="/faq/update" method="POST">
      <input type="hidden" value="${faq.f_seq}" name="f_seq" />  <!-- 데이터(번호)를 숨겨서 가져온다 -->
        
        <!-- 글 제목 -->
        <div class="form-group"> 
          <label for="txtTitle" class="col-sm-2 control-label">글 제목</label>
          <div class="col-sm-8">  <!-- 글 제목의 텍스트 칸이 8칸이라는 뜻 -->
            <input type="text" class="form-control" name="title" id="txtTitle" placeholder="글 제목을 입력합니다." required value="${faq.title}">
          </div>     
        </div>  
        
       
                
        <!-- 글 내용 -->  
        <div class="form-group"> 
          <label for="txtContent" class="col-sm-2 control-label">글 내용</label>
          <div class="col-sm-8"> <!-- 글 내용의 텍스트 칸이 8칸이라는 뜻 -->
          <textarea class="form-control" rows="10" required="required" name="content">${faq.content}</textarea> <!-- 수정하기 누르면 전에 있는 글 내용을 불러온다 -->
          </div>
        </div>
                
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-success" id='btnSubmit'>수정하기</button> <!-- 게시판 수정하기 버튼 -->
            <button type="reset" class="btn btn-warning">취소하기</button>
            <button type="button" id="btnBack" class="btn btn-info">돌아가기</button> <!-- 게시판 돌아가기 버튼 -->
          </div>
        </div>
      </form>
    </div>
  </div>
  
  <!-- textArea 이름,  글 내용 칸을 늘렸다 줄였다 할수있고 선택할수있는 카테고리가 생김 / 맨위에 스크립트도 한줄 줘야함  -->
  <script>
     CKEDITOR.replace( 'content' );  
  </script>
  
  
  <script>
  $('#btnBack').on('click', function(){
		history.back();		<!-- 돌아가기 버튼을 누르면 전 페이지로 이동 -->
	  });
  	
  </script>
<c:import url="../common/footer.jsp"/>