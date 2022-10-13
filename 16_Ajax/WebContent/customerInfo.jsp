<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript" src="js/customer.js">

</script>
<style>
	
	span {
		width: 150px;
		color: red;
	}
	
	input {
		border: 1px solid gray;
	}
	
	table {
		width: 85%;
	}
	
	.table_bg {
		background-color: pink;
	}
	
	th, td {
		border: 1px solid gray;
		text-align: center;	
		padding: 3px;
	}
	
	
</style>
</head>
<body>

	<div align="center">
		<hr width="85%" color="gray" />
		<h3>회원 정보 입력 페이지</h3>
		<hr width="85%" color="gray" />
		<br />

		<form method="post" name="inForm" id="inForm" action="">
			<table cellspacing="0">
				<tr class="table_bg">
					<th>아이디</th>
					<th>이름</th>
					<th>나이</th>
					<th>연락처</th>
					<th>주소</th>
				</tr>
				<tr>
					<td>
						<input name="id" id="id" size="15">
						<span>중복결과여부</span>
					</td>
					<td><input name="name" id="name" size="15"></td>
					<td><input name="age" id="age" size="3"></td>
					<td><input name="phone" id="phone" size="20"></td>
					<td><input name="addr" id="addr" size="15"></td>
				</tr>
				<tr>
					<td colspan="5" align="center">
					<input type="button" value="가입하기" id="btn"></td>
				</tr>
			</table>
		</form>
		<br />
		<hr width="85%">
		<br />
		<h2>고객 리스트</h2>

		<table id="listTable" cellspacing="0">
			<tr>
				<th>번 호</th>
				<th>아이디</th>
				<th>이 름</th>
				<th>나 이</th>
				<th>연락처</th>
				<th>주 소</th>
				<th>삭 제</th>
			</tr>
		</table>
	</div>
</body>
</html>