<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="dto" value="${ cont }"/>
<c:choose>
	<c:when test="${ empty no }"> <!-- 글 등록 -->
		<c:set var="writer" value="" />
		<c:set var="title" value="" />
		<c:set var="cont" value="" />
		<c:set var="password" value="" />
 		<c:set var="no" value="null" />
 		<c:set var="page" value="null" />
 		<c:set var="required" value="required='required'" />
 		<c:set var="readonly" value="" />
		<c:set var="button" value="등록" />
	</c:when>
	<c:otherwise>  <!-- 글 수정 -->
		<c:set var="writer" value="${ dto.board_writer }"/>
		<c:set var="title" value="${ dto.board_title }"/>
		<c:set var="cont" value="${ dto.board_cont }"/>
		<c:set var="password" value="${ dto.board_pwd }"/>
 		<c:set var="no" value="${ no }" />
 		<c:set var="page" value="${ page }" />
 	    <c:set var="required" value="" />
 		<c:set var="readonly" value="readonly='readonly'" />
 		<!-- disabled 사용 시 name / value 값 받지 못함^^ parameterValues 쓸 때 조심할 것^^ -->
		<c:set var="button" value="수정"/>
	</c:otherwise>
</c:choose>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="css/backtobasic.css" />
<script src="js/flower.js"></script>
<script type="text/javascript">
	
	function validateForm(form) {
		
		if($("#pwd").val() != null){ // 비밀번호 확인 기능
			if($("#pwd").val() == ${ password }){
				if(confirm("이대로 등록하시겠습니까?")){
					return true;
				}else {
					return false;
				}
			}else {
				alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
				return false;
			}
		}		
		
	}

</script>
<style type="text/css">

	table tr th {
		width: 120px;
	}
	
</style>
</head>
<body>
	<div align="center">
	<hr width="50%"/>
	<h3>글 등록 게시판</h3>
	<hr width="50%"/>
	<form name="myForm" action="<%= request.getContextPath() %>/board_write_ok.do" method="post" onsubmit="return validateForm(this)">
 		<input type="hidden" name="no" value="${ no }" />
 		<input type="hidden" name="page" value="${ page }" />
		<table>
			<tr>
				<th>작성자</th>
				<td><input type="text" size="55px" name="board" value="${ writer }" ${ readonly } ${ required }/></td>
			</tr>
			<tr>
				<th>글제목</th>
				<td><input type="text" size="55px" name="board" value="${ title }" ${ required }/></td>
			</tr>
			<tr>
				<th>글내용</th>
				<td><textarea name="board" cols="55px" rows="10" >${ cont }</textarea></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="pwd" size="55px" name="board" value="" ${ required }/></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button class="btn btn-primary" type="submit">${ button }하기</button>&nbsp;&nbsp;
					<button class="btn btn-success" type="reset">다시작성</button>
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>