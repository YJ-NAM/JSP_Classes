<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="time" value="${ System.currentTimeMillis() }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js?${ time }"></script>
<style>
	body {
		margin: 0 auto;
		text-align: center;
		width: 800px;
	}
	table {
		border: 1px solid lightgray;
	}

	table tr th, td {
		padding: 10px;
	}
</style>
</head>
<body>
	<jsp:include page="../include/user_top.jsp" />
	<div>
	<h3>Welcome! 🐾Pleasure to meet you🐾</h3>
		<hr />
		<h4>Product Lists</h4>
		<hr />
		
		<c:if test="${ empty list }">
			<span>제품 목록이 없습니다...</span>
		</c:if>
		<c:if test="${ !empty list }">
		<table class="table align-middle">
			<tr>
			<c:forEach items="${ list }" var="dto" >
				<c:set var="count" value="${ count + 1 }"/>
				<td>
				<a href="${ pageContext.request.contextPath }/user_product.do?pnum=${ dto.pnum }">
					<img src="${ pageContext.request.contextPath }/upload/${ dto.pimage }"
					width="50" height="50" />
				</a>
				<br />${ dto.pname }<br />
				<fmt:formatNumber value="${ dto.price }"/>원<br />
				<fmt:formatNumber value="${ dto.point }" var="commaPoint" /> [${ commaPoint }] 포인트<br />
				</td>
				<c:if test="${ count%3 == 0 }">
					<tr></tr>
				</c:if>
			</c:forEach>
			</tr>
		</table>
		</c:if>
		</div>
	<jsp:include page="../include/user_bottom.jsp" />
</body>
</html>