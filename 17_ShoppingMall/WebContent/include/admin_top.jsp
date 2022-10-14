<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js?${ time }"></script>
<style>

body {
	width: 800px;
	margin: 0 auto;
}

hr {
	margin: 10px;
}

div h2 {
	margin-top: 10px;
}

#title {
	text-align: right;
}

#title a {
	text-decoration: none !important;
}

table {
	padding: 10px;
}

table tr th, td {
	text-align: center;
} 

a {
	text-decoration: none;
}
</style>
</head>
<body>
	<br />
	<div align="center">
		<hr />
		<br />
		<h2><b>관리자 페이지</b></h2>
		<div id="title">
			<b>${ adminName }</b>님 환영합니다. &nbsp;&nbsp;
			<a class="btn btn-outline-danger btn-sm" href="${ pageContext.request.contextPath }/admin_logout.do">로그아웃</a>&nbsp;
		</div>
		<hr />
		<br />

		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand me-auto px-4" href="#">메뉴</a>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link px-4"
							href="${ pageContext.request.contextPath }/admin_main.do">관리자 홈</a></li>
						<li class="nav-item"><a class="nav-link px-4"
							href="${ pageContext.request.contextPath }/admin_category_input.do">카테고리 등록</a></li>
						<li class="nav-item"><a class="nav-link px-4"
							href="${ pageContext.request.contextPath }/admin_category_list.do">카테고리 목록</a></li>
						<li class="nav-item"><a class="nav-link px-4"
							href="${ pageContext.request.contextPath }/admin_product_input.do">상품 등록</a></li>
						<li class="nav-item"><a class="nav-link px-4"
							href="${ pageContext.request.contextPath }/admin_product_list.do">상품 목록</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<br />
</body>
</html>