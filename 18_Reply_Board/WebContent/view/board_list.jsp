<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="time" value="${ System.currentTimeMillis() }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,700;1,300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.js?${ time }"></script>
<link rel="stylesheet" href="css/style.css" />
</head>
<body>
	<div>
	<br />
	<h3>전체 목록 조회</h3>
	<br />
	
		<table class="table">
			<tr class="table-primary">
				<th>글번호</th> <th>글제목</th> <th>최종작성일</th> <th>작성자</th>
			</tr>
			<c:if test="${ !empty List }">
				<c:forEach items="${ List }" var="dto">
				<tr>
					<td>${ dto.bno }</td>
					<td>${ dto.title }</td>
					<c:if test="${ !empty dto.regupdate }">
					<td>${ dto.regupdate.substring(0,10) }</td>
					</c:if>
					<c:if test="${ empty dto.regupdate }">
					<td>${ dto.regdate.substring(0,10) }</td>
					</c:if>
					<td>${ dto.writer }</td>
				</tr>
				</c:forEach>
			</c:if>
			<c:if test="${ empty List }">
				<tr>
					<td colspan="4">검색된 정보가 없습니다...</td>
				</tr>
			</c:if>
			<tr>
				<td colspan="4">
					<button type="button" class="btn btn-primary" onclick="location.href='board_write.do'">글 작성</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>