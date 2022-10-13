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
<link rel="stylesheet" href="css/style.css" />
<script>

	$(function() {
		
		$(".btn").on('click', function() {			
			let btn_two = $(".btn").index(this);			
			if(btn_two == 2){
				location.href='upload_list.do';
			}	
		})		
	})
	
	function validateForm(form) {
				
		if(form.writer.value == ""){
			alert('작성자를 입력하세요.');
			form.writer.focus();
			return false;
		}
		if(form.title.value == ""){
			alert('제목을 입력하세요.');
			form.title.focus();
			return false;
		}
		if(form.content.value == ""){
			alert('내용을 입력하세요.');
			form.content.focus();
			return false;
		}
		if(form.pwd.value == ""){
			alert('비밀번호를 입력하세요.');
			form.pwd.focus();
			return false;
		}else {
			let pattern = /^[a-zA-Z0-9]{5,15}$/;
			if(!pattern.test(form.pwd.value)){
				alert("비밀번호는 영문 대소문자와 숫자로 이루어진 6~16자로 만들어야 합니다.");
				form.pwd.value = "";
				form.pwd.focus();
				return false;
			}else {
				return true;
			}			
		}
	}
	
</script>
<style>
	div {
		width: 600px;
	}
	
	table tr th {
		width: 200px;
	}
	
	table tr td {
		text-align: left;
		width: 400px;
	}
	
</style>
</head>
<body>
	<div align="center">
	<br />
	<h3>작성하기</h3>
	<hr class="border border-primary border-3 opacity-75"/>
	<br />
	
	<form name="thisFrm" method="post" action="<%= request.getContextPath() %>/upload_write_ok.do" 
		enctype="multipart/form-data" onsubmit="return validateForm(this)">
	<!-- enctype 사용 시 get 방식 사용 불가
	파일 업로드 위한 속성 // 2진 방식
	 -->
		<table class="table">
			<tr>
				<th class="table-light">작성자</th>
				<td><input class="form-control" type="text" name="writer" /></td>
			</tr>
			<tr>
				<th class="table-light">제목</th>
				<td>
				<input class="form-control" type="text" name="title" /></td>
			</tr>
			<tr>
				<th class="table-light">내용</th>
				<td>
				<textarea class="form-control" name="cont" id="content" cols="30" rows="10"></textarea>
				</td>
			</tr>
			<tr>
				<th class="table-light">첨부파일</th>
				<td><input class="form-control" type="file" name="upload_file" /></td>
			</tr>			
			<tr>
				<th class="table-light">비밀번호</th>
				<td><input class="form-control" type="password" name="pwd" /></td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="submit" class="btn btn-primary btn-md">업로드</button>&nbsp;
					<button type="reset" class="btn btn-warning btn-md">초기화</button>&nbsp;
					<button type="button" class="btn btn-danger btn-md">뒤로가기</button>
				</th>
			</tr>			
		</table>
	</form>	
	</div>
</body>
</html>