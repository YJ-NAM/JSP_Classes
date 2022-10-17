<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function check(no) {
		let res = confirm("정말로 삭제하시겠습니까?");
		if(res) {
			location.href="admin_category_delete.do?cnum="+no;
		}
	}
<%-- 	DJ코드
	<a href="<%=request.getContextPath()%>/admin/admin_category_delete.do?cnum=${dto.getCategory_num()}" 
			onclick="return confirm('이 카테고리를 삭제하시겠습니까?');" class="btn btn-sm btn-outline-danger">삭제</a> --%>

</script>
</head>
<body>
	<jsp:include page="../include/admin_top.jsp" />
	<hr />
	<h4>카테고리 테이블 전체 목록</h4>
	<hr />
	<br />
	<table class="table">
		<tr class="align-middle" >
			<th scope="col">카테고리 번호</th>
			<th scope="col">카테고리 코드</th>
			<th scope="col">카테고리 이름</th>
			<th scope="col">카테고리 삭제</th>
		</tr>
		<c:if test="${ !empty categoryList }">
			<c:forEach items="${ categoryList }" var="dto">
			<tr class="align-middle">
				<td>${ dto.category_num }</td>
				<td>${ dto.category_code }</td>
				<td>${ dto.category_name }</td>
				<td>
					<input class="btn btn-outline-danger btn-sm" type="button" value="삭제" onclick="check(${ dto.category_num })"/>
				</td>
			</tr>
			</c:forEach>
		</c:if>
		<c:if test="${ empty categoryList }">
			<tr class="align-middle">
				<td colspan="4" align="center">
					<h3>카테고리 목록 내용이 없습니다.</h3>
				</td>
			</tr>
		</c:if>
	</table>
	<jsp:include page="../include/admin_bottom.jsp" />
</body>
</html>