<%@page import="com.reply.model.BbsDAO"%>
<%@page import="com.reply.model.BbsDTO"%>
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
<script>
	$(function() {		
		$(".btn").on("click", function() {
			let btn_index = $(".btn").index(this);
			if(btn_index == 1){ // 삭제하기
				location.href = "bbs_delete.do?no=${ Cont.board_no }";
			}else if(btn_index == 2){ // 답변달기
				location.href = "bbs_reply.do?no=${ Cont.board_no }";
			}else if(btn_index == 3){ // 목록보기
				location.href = "bbs_list.do";
			}
		})	
	})
</script>
<style type="text/css">

	div {
		width: 800px;
		margin: 0 auto;
	}
	
	table tr th{
		text-align: center;
		font-size: 20px;
	}
	
	table tr td {
		text-align: left;
	}
	
	table tr #content {
		vertical-align: top;
		height: 300px;
	}
	
	table tr #hit {
		text-align: right;
	}
	
</style>
</head>
<body>	
	<div align="center">
		<hr width="80%" >
		<h3><b>${ Cont.board_title }</b> 상세 페이지</h3>
		<hr width="80%" >
		<br>		
		${ errMsg }	
		<c:remove var="errMsg"/>
		<form method="post" action="<%= request.getContextPath() %>/bbs_write.do?no=${ Cont.board_no }" >
			<input type="hidden" name="no" value="${ Cont.board_no }" />
			<input type="hidden" name="writer" value="${ Cont.board_writer }" />
			<input type="hidden" name="title" value="${ Cont.board_title }" />
			<input type="hidden" name="cont" value="${ Cont.board_cont }" />
			<input type="hidden" name="pwd" value="${ Cont.board_pwd }" />
		<table class="table">
			<tr> 
				<th colspan="2" class="table-primary">${ Cont.board_title }</th>
			</tr>		
			<tr class="table-group-divider"> 
				<td><b>작성자</b> : ${ Cont.board_writer }</td>
				<td id="hit"><b>조회수</b> : ${ Cont.board_hit }</td>
			</tr>		
			<tr> 
				<c:if test="${ empty Cont.board_update }">
					<td colspan="2"><b>작성일</b> : ${ Cont.board_date }</td>				
				</c:if>
				<c:if test="${ !empty Cont.board_update }">
					<td colspan="2"><b>최종수정일</b> : ${ Cont.board_update }</td>				
				</c:if>			
			</tr>				
			<tr> 
				<td colspan="2" id="content">${ Cont.board_cont }</td>
			</tr>						
			<c:if test="${ empty Cont }">
			<tr> 
				<td id="content" colspan="2" align="center"> 
					<h3>조회된 게시물이 없습니다.....</h3>
				</td>
			</tr>				
			</c:if>			
			<tr> 
				<th colspan="2" align="center">
					<button type="submit" class="btn btn-warning btn-md" >수정하기</button>
					<button type="button" class="btn btn-danger btn-md" >삭제하기</button>
					<button type="button" class="btn btn-success btn-md" >답변달기</button>
					<button type="button" class="btn btn-primary btn-md" >전체목록</button>
				</th> 			
			</tr>	
 		</table>
		</form>
	</div>
</body>
</html>