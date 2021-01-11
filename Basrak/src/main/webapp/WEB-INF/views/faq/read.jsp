<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../common/header.jsp" />

<div class="container">
	<div class="row">
		<h1 style="text-align: center">FaQ 읽기</h1>
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
						<strong id="title">${faq.title}</strong>
					</div>
				</td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td bgcolor="#F4F4F4">
					<table width="100%" border="0" cellpadding="0" cellspacing="4"
						height="1">
						<tr bgcolor="#F4F4F4">
							<td width="13%" height="7"></td>
							<td width="51%" height="7">글번호 : ${faq.f_seq} </td>
							<td width="25%" height="7"></td>
							<td width="11%" height="7"></td>
						</tr>
						<tr bgcolor="#F4F4F4">
							<td width="13%"></td>
							<td width="51%">작성일 : <span id='regdate'>${faq.writedate}</span></td>
							<td width="25%">조회수 : <span id='readnum'>${faq.readnum}</span></td>
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
					${faq.content}	
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
  					<button type="button" id="btnList" class="btn btn-primary">목록으로</button>&nbsp;
				</div>
            </td>
        </tr>
    </table>
	</div>
</div>


<script>
	$(function(){
		$.ajax({
			url : "/faq/readnumUpdate/" + ${faq.f_seq}, <!-- 조회수 증가 -->
			type : 'GET'
		});
	});

	<!-- 목록으로 버튼을 눌렀을 때 -->
	$('#btnList').on('click', function(){
		location.href = "/faq/list";	// 목록으로 이동
	});
</script>
<c:import url="../common/footer.jsp" />