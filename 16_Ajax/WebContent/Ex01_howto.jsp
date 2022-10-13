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
	function process() {
		$.ajax({
			type : "post",
			url : "data/test.jsp",
			data : { param : "Hello Ajax!!!" },
			datatype : "text",
			success : function(data) {
				$(".message").append(data);
			},
			error : function(data) {
				alert("에러 발생");
			}
		});
		
	}
	
</script>
</head>
<body>
	<div align="center">
		<br /><br />
		<button type="button" class="btn btn-info btn-md" onclick="process()">전송하기</button>
		<br /><br />
		<div class="message"></div>
	</div>
</body>
</html>