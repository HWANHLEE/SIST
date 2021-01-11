<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	alert('${nickname}님! 다음에 만나요.');
	location.href = '/basrak/';//session이 이미 지워진 상태에서 root페이지(index.html)로 이동
</script>