<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="../common/header.jsp" />

<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
<h1 class="text-center">QnA 글 수정하기</h1>
<div class="container">
	<div class="row">
		<form class="form-horizontal" action="/basrak/vvs/update" method="POST">
			<input type="hidden" value="${vvs.u_seq }" name="u_seq"/><!-- 번호를 숨겨서 가져간다. -->
			<!-- 글 제목 -->
			<div class="form-group">
				<label for="txtTitle" class="col-sm-2 control-label">글 제목</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="title" id="txtTitle"
						placeholder="굴 제목을 입력합니다." required value="${vvs.title }">
				</div>
			</div>
			<!-- 글 본문 -->
			<div class="form-group">
				<label for="txtContent" class="col-sm-2 control-label">글내용</label>
				<div class="col-sm-8">
					<textarea class="form-control" rows="10" required name="content">${vvs.content }</textarea>
				</div>
			</div>
			
			<!-- 버튼 -->
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-success" id='btnSubmit'>수정하기</button>
					<button type="reset" class="btn btn-warning">취소하기</button>
					<button type="button" class="btn btn-info" id="btnBack">돌아가기</button>
				</div>
			</div>
		</form>
	</div>
</div>
<script>
	CKEDITOR.replace('content');
</script>
<script>
	$('#btnBack').on('click', function(){
		location.href = "/basrak/vvs/read";
	});
</script>

<c:import url="../common/footer.jsp" />
