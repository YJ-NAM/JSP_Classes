<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="css/style.css" />
<style>
	div {
		width: 800px;
	}
</style>
</head>
<body>
	<div>
		<br />
		<h3>전체 LIST</h3>
		<hr />
		
		${ errMsg }
		<c:remove var="errMsg"/>
		
		<table class="table">
			<tr class="table-light">
				<th scope="col" width="100">No</th> 
				<th scope="col" width="300">제목</th> 
				<th scope="col" width="100">조회수</th> 
				<th scope="col" width="300">작성일/수정일</th>
			</tr>
			<c:if test="${ ! empty list }">
			<c:forEach items="${ list }" var="list">
			<tr>
				<td>${ list.upload_no }</td>
				<td><a href="<%= request.getContextPath()%>/upload_content.do?no=${ list.upload_no }">${ list.upload_title }</a></td>
				<td>${ list.upload_hit }</td>
			        <c:choose>
						<c:when test="${ !empty list.upload_update }">
						<td>${ list.upload_update }</td>		
						</c:when>
						<c:otherwise>
						<td>${ list.upload_date.substring(0,10) }</td>		
						</c:otherwise>
					</c:choose>
			</tr>
			</c:forEach>
			</c:if>
			<c:if test="${ empty list }">
			<tr>
				<td colspan="4">조회된 목록이 없습니다.</td>
			</tr>
			</c:if>
			<tr>
				<td colspan="4">
					<button type="button" class="btn btn-primary btn-md" onclick="location.href='upload_write.do'">작성하기</button>
				</td>
			</tr>
		</table>	
	</div>
</body>
</html>