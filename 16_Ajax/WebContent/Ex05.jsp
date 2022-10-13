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
<script type="text/javascript">

	$(function() {
		$(".submit").on("click", function() {
			// serialize() : 쿼리 스트링화 하는 메서드
			let data = $("form").serialize();
			alert(data);
		})
	})
	
</script>
</head>
<body>
	<!-- 쿼리 스트링 : 사용자가 웹 프로그램으로 입력한 데이터를 가장 단순하고 쉽게 전달하는 방법 -->
	<div align="center" style="width : 600px">
		<form action="">
			<table class="table">
				<tr>
					<td colspan="2">
					<h3>폼 데이터를 쿼리 스트링으로 변환</h3>
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" /></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd" /></td>
				</tr>
				<tr>
					<th>나이</th>
					<td><input type="text" name="age" /></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="phone" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<input class="btn btn-success btn-md submit" type="submit" value="전송" />&nbsp;&nbsp;
						<input class="btn btn-warning btn-md" type="reset" value="취소" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>