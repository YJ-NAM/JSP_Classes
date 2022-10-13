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
<style>
	
	div {
		width: 500px;
		margin: 0 auto;
	}

	table tr th, td{
		 text-align: center;	
		 
	}
	
</style>3
</head>
<body>
		<c:set var="dto" value="${ reply }"/>
		
		<div align="center">
			<hr>
			<h3>${ dto.board_title } 답변글 작성 페이지</h3>
			<hr>
			<br>
		
		${ errMsg }
		
		<form action="<%= request.getContextPath() %>/bbs_reply_ok.do" method="post">		
		<input type="hidden" name="no" value="${ dto.board_no }">
		<input type="hidden" name="group" value="${ dto.board_group }">
		<input type="hidden" name="step" value="${ dto.board_step }">
		<input type="hidden" name="indent" value="${ dto.board_indent }">				
		<table class="table">			
			<tr> 
				<th class="table-primary">작성자</th>
				<td>
				<input name="reply_writer" value="${ dto.board_writer }" readonly="readonly" class="form-control">
				</td>
			</tr>
		
			<tr> 
				<th class="table-primary">글제목</th>
				<td>
				<input name="reply_title" value="(답변)${ dto.board_title }" readonly="readonly" class="form-control">
				</td>
			</tr>
		
			<tr> 
				<th class="table-primary">글내용</th>
				<td>
				<textarea rows="7" cols="25" name="reply_cont" class="form-control">(원글)${ dto.board_cont }&#10;---------------------------------------&#10;</textarea>
				</td>
			</tr>
		
			<tr> 
				<th class="table-primary">비밀번호</th>
				<td>
					<input type="password" name="reply_pwd" class="form-control">
				</td>
			</tr>
				<c:if test="${ empty dto }">
					<tr> 
						<td colspan="2" align="center"> 
							<h3>조회된 게시물이 없습니다.....</h3>
						</td>
					</tr>				
				</c:if>				
				<tr> 
					<td colspan="2" align="center" >
						<input class="btn btn-primary" type="submit" value="답글달기">&nbsp;&nbsp;&nbsp;
						<input class="btn btn-warning" type="reset" value="다시작성">
					</td>
				</tr>	
			</table>			
			</form>
		</div>		
</body>
</html>