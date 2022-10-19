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
<style>
	body {
		font-family: 'Poppins', sans-serif;
	}
	
	div {
		width: 800px;
		margin: 0 auto;
		text-align: center;
	}
</style>
</head>
<body>
	<div align="center">
		<hr />
		<h3>User Login Page</h3>
		<hr />
		<br />
		<form method="post" action="${ pageContext.request.contextPath }/user_login_save.do">
			<table class="table align-middle">
				<tr class="col-3">
					<th scope="row">User Id</th>
					<td>
						<input type="text" class="form-control" placeholder="ID" name="user_id" />
					</td>
				</tr>
				<tr>
					<th scope="row">User Password</th>
					<td>
						<input type="password" class="form-control" placeholder="Password" name="user_pwd" />
					</td>
				</tr>			
				<tr>
					<td colspan="2" align="center">
						<input class="btn btn-primary btn-md" type="submit" value="Login" />&nbsp;&nbsp;
						<input class="btn btn-warning btn-md" type="reset" value="Reset" />
					</td>
				</tr>							
			</table>
		</form>
	</div>
</body>
</html>