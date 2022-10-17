<%@page import="com.shop.model.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.shop.model.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="time" value="${ System.currentTimeMillis() }" />
<%
	CategoryDAO dao = CategoryDAO.getInstance();
	List<CategoryDTO> list = dao.getCategoryList();
	request.setAttribute("categoryList", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js?${ time }"></script>
<style>
	body {
		margin: 0 auto;
	}
	
	a {
		text-decoration: none;
	}
	
	.top {
		font-size: 1.5em;
	}
</style>
</head>
<body>
	<div align="center">
		<table class="table">
			<tr>
				<td colspan="2" class="align-middle" align="center" >
					<a href="${ pageContext.request.contextPath }/user_main.do">
						<span class="top material-symbols-outlined">home</span></a>&nbsp;&nbsp;&nbsp;
					<a href="${ pageContext.request.contextPath }/user_cart_list.do">
						<span class="top material-symbols-outlined">shopping_cart</span></a>&nbsp;&nbsp;&nbsp;
					<span> ${ userName }님 환영합니다.</span>&nbsp;&nbsp;&nbsp;
					<a class="btn btn-outline-danger btn-sm" href="${ pageContext.request.contextPath }/user_logout.do">Logout</a>
				</td>
			</tr>
			<tr>
				<td>
					<table class="table">
						<tr>
							<td>Category code</td>
						</tr>
						<c:if test="${ !empty categoryList }">
							<c:forEach items="${ categoryList }" var="dto">
							<tr>
								<td>
									<a href="${ pageContext.request.contextPath }/user_category_list.do?code=${ dto.category_code }">
									${ dto.category_name }[${ dto.category_code }]
									</a>
								</td>
							</tr>
							</c:forEach>
						</c:if>
					</table>
				</td> <%-- 이하 영역은 본문 영역이 됨 --%>
				<td>
