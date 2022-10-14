<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="time" value="${ System.currentTimeMillis() }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js?${ time }"></script>
</head>
<style>
	div {
		width: 600px;
		margin: 0 auto;
	}
	
	table tr {
		text-align: center;
	}
	
</style>
<body>
	<div align="center">
		<hr />
		<h3>쇼핑몰 메인 페이지</h3>
		<hr />
		<br />
		<form method="post" action="${ pageContext.request.contextPath }/admin_login.do">
			<table class="table">
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" class="form-control" placeholder="ID" name="admin_id" />
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" class="form-control" placeholder="Password" name="admin_pwd" />
					</td>
				</tr>			
				<tr>
					<td colspan="2" align="center">
						<input class="btn btn-primary btn-sm" type="submit" value="로그인" />&nbsp;&nbsp;
						<input class="btn btn-warning btn-sm" type="reset" value="초기화" />
					</td>
				</tr>							
			</table>
		</form>
	</div>
</body>
</html>