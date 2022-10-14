<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/admin_top.jsp" />
	<hr width=""/>
	<h4>폼 페이지</h4>
	<hr width=""/>
	<form action="${ pageContext.request.contextPath }/admin_category_input_save.do">
		<table class="table align-items-center">
			<tr>
				<th scope="row" class="align-middle">카테고리 코드</th>
				<td><input class="form-control" type="text" name="category_code" /></td>
			</tr>
			<tr>
				<th scope="row" class="align-middle">카테고리 이름</th>
				<td><input class="form-control" type="text" name="category_name" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" class="btn btn-primary btn-md" value="등록하기" />&nbsp;&nbsp;
					<input type="reset" class="btn btn-danger btn-md" value="취소하기" />
				</td>
			</tr>		
		</table>
	</form>
	<jsp:include page="../include/admin_bottom.jsp" />
</body>
</html>