<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="time" value="${ System.currentTimeMillis() }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 메인 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,700;1,300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.js?${ time }"></script>
<style>
	body {
		font-family: 'Poppins', sans-serif;
	}
</style>
</head>
<body>
	<div align="center">
		${ logoutMsg }
		<hr />
		<h3>쇼핑몰 메인 페이지</h3>
		<hr />
		<br />
		
		<a class="btn btn-outline-primary" href="${ pageContext.request.contextPath }/member_login.do">회원</a>&nbsp;&nbsp;
		<a class="btn btn-outline-info" href="${ pageContext.request.contextPath }/admin_login.do">관리자</a>
		
	</div>

</body>
</html>