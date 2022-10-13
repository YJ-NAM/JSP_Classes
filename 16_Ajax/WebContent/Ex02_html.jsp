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

	// 문서의 body 부분을 읽고 난 후 제이쿼리를 실행하라는 의미
	$(function() {
		$.ajax({
			type : "post",
			url : "data/data.html",
			datatype : "html",
			
			/* 동진님 코드
			success : function(data) {
                $("body").html(data);
            },

            error : function(e) {
                alert("Error : "+e.status);
            } */
            
			success : function(data) {
				document.body.innerHTML = data;
			},
			error : function(data) {
				alert("에러가 발생했습니다.");
			}
		});
	})

</script>
</head>
<body>

</body>
</html>