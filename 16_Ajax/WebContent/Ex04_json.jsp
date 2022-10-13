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
		$.ajax({
			type : "post",
			url : "data/data.json", // json : key, value 값으로 이루어진 형태 
			// 하나하나의 중괄호가 객체, 객체 배열 형식이라고 보면 됨
			datatype : "json",
			success : function(data) {
				// index : data 객체 내의 인덱스 의미함
				// item : data 객체 내의 이름과 값을 가지고 있는 객체를 말함
				$.each(data, function(index, item) {
					let txt = "<li>제목 : "+item.title+"</li>" +
					"<li>저자 : "+item.author+"</li>" +
					"<li>가격 : "+item.price+"</li><hr>";
					$("body").append(txt);
				});
			},
			error : function(data) {
				alert("통신 오류");
			}
		})
	})
</script>
</head>
<body>
</body>
</html>