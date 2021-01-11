<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../common/header.jsp" />
<c:set var="user" value="${userInfo}" />
<style>
	body{
	   	background-color : #fdf1d2;
}
</style>
<c:if test="${not empty user}">
	<c:set var="session_nickname" value="${vvs.nickname }" scope="session"/>
	<c:set var="session_u_seq" value="${vvs.u_seq }" scope="session"/>
</c:if>

<div class="container">
	<div class="row">
		<h1 style="text-align: center">게시글 읽기</h1>
		<table width="600" style="margin: auto" cellspacing="0" cellpadding="2">
			<tr>
				<td height="22">&nbsp;</td>
			</tr>
			<tr>
				<td height="1" bgcolor="#1F4F8F"></td>
			</tr>
			<tr bgcolor="#DFEDFF">
				<td bgcolor="#DFEDFF">
					<div>
						<strong id="title">${vvs.title }</strong>
					</div>
				</td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td bgcolor="#F4F4F4">
					<table width="100%" border="0" cellpadding="0" cellspacing="4"
						height="1">
						<tr bgcolor="#F4F4F4">
							<td width="13%" height="7"></td>
							<td width="51%" height="7">
								닉네임 : <span id="nickname">${vvs.nickname }</span>
							</td>

							<td width="25%" height="7">글번호 : ${vvs.u_seq }</td>
							<td width="11%" height="7"></td>
						</tr>
						<tr bgcolor="#F4F4F4">
							<td width="13%"></td>
							<td width="51%">작성일 : <span id='writedate'>${vvs.writedate }</span></td>
							<td width="25%">조회수 : <span id='readnum'>${vvs.readnum }</span></td>
							<td width="11%"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr align="center">
				<td bgcolor="#1F4F8F" height="1"></td>
			</tr>
			<tr>
				<td style="padding: 20 0 20 0"><br /> <span
					style="color: #333333" id='contents'></span>
				${vvs.content }
				</td>
			</tr>
			<tr align="center">
				<td class="button" height="1"></td>
			</tr>
			<tr align="center">
				<td bgcolor="#1F4F8F" height="1"></td>
			</tr>
		</table>
		<table width="600" style="margin:auto" border="0" cellpadding="0" cellspacing="5">
	        <tr> 
	            <td class="text-right">
	            	<div>
					  <button type="button" class="btn btn-primary" id="btnList">목록으로</button>&nbsp;
					  <c:if test="${vvs.nickname eq session_nickname}">
					  	<button type="button" class="btn btn-success" id="btnUpdate">수정하기</button>&nbsp;
					  	<button type="button" class="btn btn-info" id="btnBbsDelete">삭제하기</button>
					  </c:if>
					  <c:if test="${vvs.nickname ne session_nickname}">
					  	<button type="button" class="btn btn-success" disabled="disabled">수정하기</button>&nbsp;
					  	<button type="button" class="btn btn-info" disabled="disabled">삭제하기</button>
					  </c:if>
					</div>
            	</td>
	        </tr>
	    </table>
	</div>
</div>
<br />
<script>
	$(function(){
		$.ajax({
			url : "/basrak/vvs/readnumUpdate/" + ${vvs.u_seq}, 
			type : 'GET',
		});
	});
	$('#btnList').on('click', function(){
		location.href = "/basrak/vvs/list?page=1";
	});
	$('#btnBbsDelete').on('click', function(){
		if(confirm("정말 삭제하시겠습니까? ")){
			location.href="/basrak/vvs/delete?u_seq=" + ${vvs.u_seq};
		}else{
			history.go(0);
		}
	});
	$('#btnUpdate').on('click', function(){
		location.href = "/basrak/vvs/update?u_seq=" + ${vvs.u_seq};
	});
</script>
<c:import url="../common/footter.jsp" />    