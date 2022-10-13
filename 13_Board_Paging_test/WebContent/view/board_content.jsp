<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% request.setAttribute("newLine", "\n"); %>
<c:set var="dto" value="${ cont }" />
<c:set var="page" value="${ Page }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="js/flower.js"></script>
<link rel="stylesheet" href="css/backtobasic.css" />
<script>

	$(function() {
		
		$(".btn").click(function() {
			let btn_index = $(".btn").index(this);		
			if(btn_index == 0){
				location.href='board_write.do?no=${ dto.board_no }&page=${ page }';
			}else if(btn_index == 1){
				if($("#deletePopup").css("visibility") == "visible"){
					$("#deletePopup").css("visibility", "hidden");
				}else {
					$("#deletePopup").css("visibility", "visible");
				}
			}else if(btn_index == 2){
				location.href='board_list.do?page=${ page }';
			}
		})
	})
	
	function validateForm(form) {
		
		if($("#pwd").val() != null){
			if($("#pwd").val() == ${ cont.board_pwd }){
				return true;
			}else {
				alert("비밀번호를 확인해주세요.");
				$("#pwd").val("");
				$("#pwd").focus();
				return false;
			}
		}
	}
	
</script>
<style>

	.leftAlign {
		text-align: left;
	}
	
	#title {
		font-size: 20px;
	}
	
	.contentText {
		height: 300px;
		text-align: left;
		vertical-align: top;
	}
	
	#final {
		background-color: Crimson !important;
		width: 45px !important;
		height: 30px !important;
		font-size: 12px !important;
		padding: 1px !important;
	}
	
	#final:hover {
		background-color: LightCoral !important;
		border: 0px !important;
	}
	
	span {
	 	color: Crimson;
	}
	
	#deletePopup {
		visibility: hidden;
	}
	
</style>
</head>
<body>
	<div align="center">
	<hr />
	<h3>${ dto.board_title } 상세 정보 </h3>
	<hr />
	<table>
		<c:if test="${ !empty dto }">
		<tr>
			<th id="title" colspan="4">${ dto.board_title }</th>
		</tr>
		<tr>
			<td class="leftAlign">작성자 : <b>${ dto.board_writer }</b></td>
			<td rowspan="2" align="right">${ dto.board_hit }</td>
		</tr>
		<tr>
			<c:choose>
				<c:when test="${ empty dto.board_update }">
				<td class="leftAlign">작성일 : ${ dto.board_date }</td>
				</c:when>
				<c:otherwise>
				<td class="leftAlign">최종수정일 : ${ dto.board_update }</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<td class="contentText" colspan="2">${ fn:replace(dto.board_cont, newLine, '<br>') }</td>
		</tr>
		</c:if>
		<c:if test="${ empty dto }">
		<tr>
			<td colspan="4">조회된 내역이 없습니다...</td>
		</tr>
		</c:if>
		<tr>
			<td colspan="4">
				<button type="button" class="btn btn-warning">수정하기</button>&nbsp;
				<button type="button" class="btn btn-danger">삭제하기</button>&nbsp;
				<button type="button" class="btn btn-primary">목록보기</button>
			</td>
		</tr>
	</table>
	<br />
	<div id="deletePopup">
		<form name="deleteForm" action="<%= request.getContextPath() %>/board_delete.do?no=${ dto.board_no }" method="post" onsubmit="return validateForm(this)">
		<table>
			<tr>
				<td colspan="2" align="center">
					<b>비밀번호를 입력하세요 <span>▶</span> </b>&nbsp;<input type="password" id="pwd" />&nbsp;
					<button type="submit" class="btn btn-danger" id="final">삭제</button>
				</td>
			</tr>
		</table>
		</form>
	</div>
	</div>
</body>
</html>