<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/snow.css" />
<style type="text/css">

	body {
		background-color: #74EBD5;
		background-image: -webkit-linear-gradient(90deg, #74EBD5 0%, #9FACE6 100%);
		background-image: -moz-linear-gradient(90deg, #74EBD5 0%, #9FACE6 100%);
		background-image: -o-linear-gradient(90deg, #74EBD5 0%, #9FACE6 100%);
		background-image: -webkit-gradient(linear, 0 100%, 0 0, from(#74EBD5), to(#9FACE6));
		background-image: linear-gradient(90deg, #74EBD5 0%, #9FACE6 100%);
	}
	
	div h3 {
		color: GhostWhite;
		font-weight: bolder;
	}
	
	table {
		text-align: center;	
		width: 600px;
		border: 1px solid #74EBD5;
	}
	
	table tr th {
		padding: 10px;
		background: #9FACE6;
	}
	
	table tr td {
		padding: 10px;
		background: white;		
	}

</style>
</head>
<body>
	<div class="snowflakes" aria-hidden="true">
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
		<hr width="50%" color="red"/>
		<h3>MEMBER10 테이블 전체 회원 리스트</h3>
		<hr width="50%" color="red"/>
		<br />
		
		<table>
			<tr>
				<th>회원No</th> <th>회원 아이디</th> <th>회원명</th> <th>회원 가입일</th>
			</tr>
			<c:if test="${ !empty List }">
				<c:forEach items="${ List }" var="dto" varStatus="status">
					<tr>
						<td>${ fn:length(List) - status.index }</td>
						<td>${ dto.memid }</td>
						<td><a href="<%= request.getContextPath() %>/content.do?num=${ dto.num }">${ dto.memname }</a></td>
						<td>${ dto.regdate.substring(0,10) }</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${ empty List }">
				<tr>
					<td colspan="4" align="center">
						<h3>전체 회원 리스트가 없습니다...</h3>
					</td>
				</tr>				
			</c:if>
			<tr>
				<td colspan="4" align="center">
					<button type="button" class="btn btn-primary" onclick="location.href='insert.do'">회원등록</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>