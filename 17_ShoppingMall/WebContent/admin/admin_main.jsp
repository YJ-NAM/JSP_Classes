<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="time" value="${ System.currentTimeMillis() }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js?${ time }"></script>
<style>
	div {
		margin: 0 auto;
		width: 800px;
	}
	
	ul {
		align-items: center;
	}
	
	ul li {
		list-style: none;
		display: inline-block;
	}
	
	.nav-link {
		text-decoration: none !important;
	}
	
</style>
</head>
<body>
	${ msg }
	<c:remove var="msg" />
	
	<jsp:include page="../include/admin_top.jsp" />
	<ul class="nav nav-pills nav-fill justify-content-center">
		<li class="nav-item">
			<a class="btn btn-outline-primary" aria-current="page" href="${ pageContext.request.contextPath }/admin_category_input.do">카테고리 등록</a>
		</li>
		<li class="nav-item">
			<a class="btn btn-outline-success" aria-current="page" href="${ pageContext.request.contextPath }/admin_category_list.do">카테고리 목록</a>
		</li>
		<li class="nav-item">
			<a class="btn btn-outline-info" aria-current="page" href="${ pageContext.request.contextPath }/admin_product_input.do">상품 등록</a>
		</li>
	</ul>
	<jsp:include page="../include/admin_bottom.jsp" />
</body>
</html>