<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			if(btn_index == 0){
				location.href='upload_modify.do?no=${ dto.upload_no }';
			}
			if(btn_index == 1){
				location.href='upload_delete.do?no=${ dto.upload_no }';
			}
			if(btn_index == 2){
				location.href='upload_list.do';
			}
		})		
	})

</script>
<style>
	div {
		width: 800px;
	}
	
	table tr th {
		border-top: 1px solid lightgray;
	}
	
	table tr td {
		text-align: left;
	}
	
	table tr #right {
		text-align: right;
	}
	
	#content {
		height: 300px;
	
	}
	
</style>
</head>
<body>
	<div>
		<br />
		<h3><b>${ dto.upload_title }</b> 상세 페이지 </h3>
		<hr />
		<br />
		
		${ errMsg }		
		<c:remove var="errMsg"/>
				
		<table class="table">
			<tr>
				<th class="table-light" colspan="2">${ dto.upload_title }</th>
			</tr>
			<tr>
				<td><b>작성자</b> ${ dto.upload_writer }</td>
				<td id="right"><b>조회수</b> ${ dto.upload_hit }</td>
			</tr>
			<tr>
				<td colspan="2" id="content">${ dto.upload_cont }</td>
			</tr>
			<tr>
				<c:if test="${ !empty dto.upload_file }" >
				<td colspan="4">
					<b>첨부파일</b> 
					<a href="<%= request.getContextPath() %>/upload/${ dto.upload_file }"
					target="_blank">${ dto.upload_file }</a>
				</td>
				</c:if>
				<c:if test="${ empty dto.upload_file }">
				<td colspan="2">첨부파일 없음</td>
				</c:if>
			<tr>
				<c:if test="${ empty dto.upload_update }"> 
				<td colspan="2"><b>작성일</b> ${ dto.upload_date }</td>
				</c:if>
				<c:if test="${ !empty dto.upload_update }"> 
				<td colspan="2"><b>최종수정일</b> ${ dto.upload_update }</td>
				</c:if>
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" class="btn btn-warning" >수정하기</button>&nbsp;&nbsp;
					<button type="button" class="btn btn-danger" >삭제하기</button>&nbsp;&nbsp;
					<button type="button" class="btn btn-primary" >전체목록</button>
				</th>			
			</tr>
		</table>
	</div>
</body>
</html>