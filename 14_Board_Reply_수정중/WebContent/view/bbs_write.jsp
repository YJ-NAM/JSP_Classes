<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${ !empty param.no }"> <!-- 글 수정 -->
		<c:set var="semiTitle" value="수정"/>
		<c:set var="title" value="${ param.title }"/>
		<c:set var="writer" value="${ param.writer }"/>
		<c:set var="cont" value="${ param.cont }"/>
		<c:set var="button" value="수정"/>
		<c:set var="readonly" value="readonly='readonly'"/>
		<c:set var="no" value="${ param.no }"/>
		<c:set var="pwd" value="${ param.pwd }"/>
	</c:when>
	<c:otherwise> <!-- 글 등록 -->
		<c:set var="semiTitle" value="글 등록"/>
		<c:set var="title" value=""/>
		<c:set var="writer" value=""/>
		<c:set var="cont" value=""/>
		<c:set var="button" value="등록"/>
		<c:set var="readonly" value=""/>
		<c:set var="no" value="null"/>
		<c:set var="pwd" value=""/>
	</c:otherwise>
</c:choose>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
	
	function validateForm(form) {
		
		if(form.title.value == "") {
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}
		
		if(form.writer.value == ""){
			alert("작성자를 입력하세요.");
			form.writer.focus();
			return false;
		}
		
		if(form.content.value == ""){
			alert("내용을 입력하세요.");
			form.content.focus();
			return false;
		}
		
		if(form.pwd.value == ""){
			alert("비밀번호를 입력하세요.");
			form.pwd.focus();
			return false;
		}		
		
		if(form.pwd.value == ${ pwd }){
			return true;
		}else {
			alert('비밀번호가 일치하지 않습니다.');
			form.pwd.value = ""; // = 하나여야함,,,^^ 값 입력이기 때문
			return false;
		}
	}

</script>
<style>

	div {
		width: 600px;
		margin: 0 auto;
	}
	
	table tr th, td{
		text-align: center;
	}
	
	table tr th {
		vertical-align: middle;
	}

</style>
</head>
<body>
	<div align="center">
		<hr>
		<h3><b>${ title }</b> ${ semiTitle } 페이지</h3>	
		<hr>
		<br>
		
		${ errMsg }
		
		<form name="bbsForm" action="<%= request.getContextPath() %>/bbs_write_ok.do" method="post" onsubmit="return validateForm(this)">
			<input type="hidden" name="no" value="${ no }" />
			<input type="hidden" name="dbPwd" value="${ pwd }" />
			<table class="table"> 
				<tr> 
					<th class="table-primary">작성자</th>
					<td> 
						<input name="writer" value="${ writer }" class="form-control" ${ readonly }>
					</td>
				</tr>
			
				<tr> 
					<th class="table-primary">제목</th>
					<td> 
						<input name="title" value="${ title }" class="form-control" >
					</td>
				</tr>
			
				<tr> 
					<th class="table-primary">내용</th>
					<td> 
						<textarea rows="7" cols="25" name="content" class="form-control">${ cont }</textarea>
					</td>
				</tr>			
				<tr> 
					<th class="table-primary">비밀번호</th>
					<td> 
						<input type="password" name="pwd" class="form-control">
					</td>
				</tr>				
				<tr> 
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-primary btn-md">${ button }하기</button>	&nbsp;&nbsp;
						<button type="reset" class="btn btn-success btn-md">다시작성</button>
					</td>	
				</tr>
			</table>
		</form>
	</div>
</body>
</html>