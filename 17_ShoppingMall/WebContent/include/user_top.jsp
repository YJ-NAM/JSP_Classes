<%@page import="com.shop.model.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.shop.model.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="time" value="${ System.currentTimeMillis() }" />
<%
	CategoryDAO dao = CategoryDAO.getInstance();
	List<CategoryDTO> categoryList = dao.getCategoryList();
	request.setAttribute("list", categoryList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,700;1,300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.js?${ time }"></script>
<style>
	body {
		margin: 0 auto;
		text-align: center;
		width: 900px;
		font-family: 'Poppins', sans-serif;
	}
	
	table {
		border: 1px solid lightgray;
	}

	table tr th, td {
		padding: 10px;
	}
	
	#welcome {
		vertical-align: sub;
	}
	
	a {
		text-decoration: none;
	}
	
	.top {
		font-size: 2em;
		font-weight: normal;
		cursor: pointer;
		vertical-align: middle;
	}
	
	.top:hover {
		background: linear-gradient(to right, #30CFD0 0%, #330867 100%);
		-webkit-background-clip: text;
		-webkit-text-fill-color: transparent;
	}
	
	img {
		height : 100%;
		width: 100%;
	}
	
	.card-title {
		font-weight: bolder;
	}
	
	#point {
		color: lightgray;
		font-style: italic;
	}
	#point:hover {
		color: gray;
		font-style: normal;
	}
	
</style>
</head>
<body>
	<div align="center">
		<table class="table">
			<tr class="align-middle" >
				<td colspan="2" align="right" >
					<span id="welcome"><b>${ userName }</b>님 환영합니다.</span>&nbsp;&nbsp;&nbsp;
					<span onclick="location.href='${ pageContext.request.contextPath }/user_main.do'" class="top material-symbols-outlined">home</span>&nbsp;&nbsp;&nbsp;
					<span onclick="location.href='${ pageContext.request.contextPath }/user_cart_list.do'"class="top material-symbols-outlined">shopping_cart</span>&nbsp;&nbsp;&nbsp;
					<a class="btn btn-outline-danger btn-sm" href="${ pageContext.request.contextPath }/user_logout.do">Logout</a>
				</td>
			</tr>
			<tr>
				<td>
					<table class="table" >
						<tr>
							<td>Category code</td>
						</tr>
						<c:if test="${ !empty list }">
							<c:forEach items="${ list }" var="dto">
							<tr>
								<td>
									<a href="${ pageContext.request.contextPath }/user_category_list.do?code=${ dto.category_code }">${ dto.category_name }[${ dto.category_code }]</a>
								</td>
							</tr>
							</c:forEach>
						</c:if>
					</table>
				</td> <%-- 이하 영역은 본문 영역이 됨 --%>
				<td>
