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
<script>
	$(function() {
		// 회원가입 폼 페이지에서 아이디중복체크라는 버튼에 마우스가 올라갔을 때 호출되는 무명함수
		$("#idcheck_btn").mouseover(function() {
			$("#idcheck").hide();
			let userId = $("#member_id").val();
			
			// 입력 길이 체크 - 4자 이상 조건
			if($.trim($("#member_id").val()).length < 4){
				let warningTxt = '<font color="red"> 아이디는 4자 이상이어야 합니다. </font>';
				$("#idcheck").text(""); // span 태그 영역 초기화
				$("#idcheck").show();
				$("#idcheck").append(warningTxt);
				$("#member_id").val("").focus();
				return false;
			}
			
			// 입력 길이 체크 - 16자 이하 조건
			if($.trim($("#member_id").val()).length > 16){
				let warningTxt = '<font color="violet"> 아이디는 16자 이하여야 합니다. </font>';
				$("#idcheck").text(""); // span 태그 영역 초기화
				$("#idcheck").show();
				$("#idcheck").append(warningTxt);
				$("#member_id").val("").focus();
				return false;
			}
			
			// 아이디 중복 여부 확인 - Ajax
			$.ajax({
				type : "post",
				url : "data/idCheck.jsp",
				data : { paramId : userId },
				datatype : "jsp",
				success : function(data) { // 3번째 data 값
					if(data == 1){ // DB에 아이디가 존재하는 경우
						let warningTxt = '<font color="red"> 중복 아이디입니다. </font>';
						$("#idcheck").text(""); // span 태그 영역 초기화
						$("#idcheck").show();
						$("#idcheck").append(warningTxt);
						$("#member_id").val("").focus();
						// $("#member_id").val("");
						// $("#member_id").focus();
						// 이렇게 해도 됨~!
					}else {
						let warningTxt = '<font color="green"> 사용 가능한 아이디입니다. </font>';
						$("#idcheck").text(""); // span 태그 영역 초기화
						$("#idcheck").show();
						$("#idcheck").append(warningTxt);
					}
				},
				error : function(data) {
					alert("통신 오류");
				}
			})
		})
	})

</script>
<style type="text/css">

	table tr th, td{
		padding: 10px;
		border: 1px solid lightgray;
	}
	
	table tr th {
		background-color: lightgray;
		font-weight: bolder;
	}
	

</style>
</head>
<body>
	<div align="center">
	<hr />
	<h3>회원가입 페이지</h3>
	<hr />
	<br />
	<form action="http://www.naver.com">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="member_id" id="member_id" size="20"/>
					<input type="button" class="btn btn-dark btn-sm" value="아이디 중복 체크" id="idcheck_btn"/><br />
					<span id="idcheck"></span>				
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>