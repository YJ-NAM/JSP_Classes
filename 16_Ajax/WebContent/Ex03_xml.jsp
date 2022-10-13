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
		$.ajax({
			type : "post",
			url : "data/book.xml",
			datatype : "xml",
			success : function(data) {
				$(data).find("book").each(function() {
					let title = $("title", this).text();
					let author = $("author", this).text();
					let price = $("price", this).text();
					let txt = "<li>제목 : "+title+"</li>" +
					"<li>저자 : "+author+"</li>" +
					"<li>가격 : "+price+"</li><hr>";
					$("body").append(txt);
				}); // book 객체에 감싸진 애들을 찾아라
				// 거기서 각각의 태그에 감싸진 애들의 text 값 뽑아냄~
			},
			error : function(data) {
				alert("데이터 통신 오류입니다.");
			}
		})
	})
	
</script>
</head>
<body>

</body>
</html>