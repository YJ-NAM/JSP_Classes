<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="css/snow.css" />
</head>
<body>
	<div class="snowflakes" aria-hidden="true">
	  <div class="snowflake">
	  🎇
	  </div>
	  <div class="snowflake">
	  ❅
	  </div>
	  <div class="snowflake">
	  ❆
	  </div>
	  <div class="snowflake">
	  ❅
	  </div>
	  <div class="snowflake">
	  ❆
	  </div>
	  <div class="snowflake">
	  ❅
	  </div>
	  <div class="snowflake">
	  ❆
	  </div>
	  <div class="snowflake">
	    ❅
	  </div>
	  <div class="snowflake">
	    ❆
	  </div>
	  <div class="snowflake">
	    ❅
	  </div>
	  <div class="snowflake">
	    ❆
	  </div>
	  <div class="snowflake">
	    ❅
	  </div>
	  <div class="snowflake">
	    ❆
	  </div>
	</div>
  
	<div align="center">
		<hr width="50%" color="gray"/>
		<h3>MEMBER10 테이블 메인 페이지</h3>
		<hr width="50%" color="gray"/>
		<br />
		<a href="<%= request.getContextPath() %>/select.do">[전체 회원 목록]</a>
	</div>

</body>
</html>