<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style type="text/css">
	
	div {
		width: 900px;
		margin: 0 auto;
		text-align: center;
	}
	
	table tr th, td {
		text-align: center;
	}

	table tr td a {
		display: block;
		text-decoration: none;
	}
	
	table tr #title {
		text-align: left;
	}

</style>
</head>
<body>	
	<div align="center">
		<hr>
		<h3>JSP_BBS 테이블 답변형 게시판 전체 리스트 페이지</h3>
		<hr>
		<br>
		${ errMsg }
		<c:remove var="errMsg"/>
		
		<table class="table">		
			<thead>
			<tr class="table-primary">
				<th>글번호</th>
				<th>글제목</th>
				<th>조회수</th>
				<th>작성일자</th>
				<th>Group</th>
				<th>Step</th>
				<th>Indent</th>
			</tr>
			</thead>
			<tbody class="table-group-divider">
			<c:if test="${ !empty List }">
				<c:forEach items="${ List }" var="dto">
					<tr> 
						<td>${ dto.board_no }</td>
						<td id="title">
						<%-- 댓글인 경우 --%>
						<a href="<%= request.getContextPath() %>/bbs_content.do?no=${ dto.board_no }">
						<c:if test="${ dto.board_indent != 0 }">
							<c:forEach begin="1" end="${ dto.board_indent }">
							&nbsp;&nbsp;&nbsp;↳
							</c:forEach>
						</c:if>
						${ dto.board_title }</a>
						</td>
						<td>${ dto.board_hit }</td>
						<td>${ dto.board_date.substring(0, 16) }</td>
						<td>${ dto.board_group }</td>
						<td>${ dto.board_step }</td>
						<td>${ dto.board_indent }</td>
					</tr>
				</c:forEach>
			</c:if>			
			<c:if test="${empty List }">
				<tr> 
					<td colspan="7">
						<h3>조회된 게시물이 없습니다.....</h3>
					 </td>
				</tr>			
			</c:if>
			<tr> 
				<td colspan="7"> 
					<button type="button" class="btn btn-primary" onclick="location.href='bbs_write.do'">글쓰기</button>				
				</td>
			</tr>
			</tbody>
		</table>
	</div>
</body>
</html>