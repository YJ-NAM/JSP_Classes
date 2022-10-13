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
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="css/style.css" />
<script>

	$(function() {
		
		$(".btn").on("click", function() {
			
			let btn_index = $(".btn").index(this);
			if(btn_index == 2){
				location.href = 'upload_list.do';
			}			
		})		
	})

</script>
<style>

	div {
		width: 600px;
	}
	
	table tr th {
		width: 200px;
	}
	
	table tr td {
		width: 400px;
		text-align: left;
	}
	
</style>
</head>
<body>
	<div>
		<br />
		<h3><b>${ Modify.upload_title }</b> 수정 페이지</h3>
		<hr class="border border-primary border-3 opacity-75"/>
		<br />		
		<form action="${ pageContext.request.contextPath }/upload_modify_ok.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="upload_no" value="${ Modify.upload_no }"/>
			<table class="table">
			<tr>
				<th class="table-light">작성자</th>
				<td><input class="form-control" type="text" name="writer" readonly="readonly" value="${ Modify.upload_writer }" /></td>
			</tr>
			<tr>
				<th class="table-light">제목</th>
				<td><input class="form-control" type="text" name="title" value="${ Modify.upload_title }" /></td>
			</tr>
			<tr>
				<th class="table-light">내용</th>
				<td><textarea class="form-control" id="content" name="cont" cols="30" rows="10">${ Modify.upload_cont }</textarea></td>
			</tr>
			<tr>
				<th class="table-light">첨부파일</th>
				<td><input class="form-control" type="file" name="upload_file" value="${ Modify.upload_file }" /></td>
			</tr>			
			<tr>
				<th class="table-light">비밀번호</th>
				<td><input class="form-control" type="password" name="pwd" value="" /></td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="submit" class="btn btn-primary btn-md">수정하기</button>&nbsp;
					<button type="reset" class="btn btn-warning btn-md">초기화</button>&nbsp;
					<button type="button" class="btn btn-danger btn-md">뒤로가기</button>					
				</th>
			</tr>			
		</table>		
		</form>
	</div>
</body>
</html>