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
</head>
<body>
	<div>
	<hr />
	<h3>게시글 삭제 폼 페이지</h3>
	<hr />
		<form method="post" action="${ pageContext.request.contextPath }/upload_delete_ok.do">
			<input type="hidden" name="no" value="${ param.no }" />
			<table class="table">
				<tr>
					<th>게시글 비밀번호</th>
					<td>
						<input type="password" name="pwd" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit" class="btn btn-danger">글삭제</button>
						<button type="reset" class="btn btn-warning">초기화</button>
					</td>
				</tr>
			</table>				
		</form>
	</div>
</body>
</html>