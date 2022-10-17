<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
</style>
<body>
	<jsp:include page="../include/admin_top.jsp" />
	<hr />
	<h4>SHOP_PRODUCTS 제품 전체 리스트</h4>
	<hr />
	
	<table class="table align-middle">
		<tr>
			<th scope="col">제품No</th>
			<th scope="col">카테고리 코드</th>
			<th scope="col">제품명</th>
			<th scope="col">이미지</th>
			<th scope="col">제품가격</th>
			<th scope="col">수량</th>
			<th scope="col">제조사</th>
			<th scope="col">제품등록일</th>
			<th scope="col">수정/삭제</th>
		</tr>
		<c:if test="${ !empty productList }">
			<c:forEach items="${ productList }" var="dto">
			<tr>
				<td>${ dto.pnum }</td>
				<td>${ dto.pcategory_fk }</td>
				<td>${ dto.pname }</td>
				<td>
					<img width="50%" height="50%" alt="" 
					src="${ pageContext.request.contextPath }/upload/${ dto.pimage }">
				</td>
				<td><fmt:formatNumber value="${ dto.price }" /> 원</td>
				<td>${ dto.pqty }</td>
				<td>${ dto.pcompany }</td>
				<td>${ dto.pinputdate.substring(0,10) }</td>
				<td>
					<a class="btn btn-outline-warning btn-sm" href="${ pageContext.request.contextPath }/admin_product_modify.do?pnum=${ dto.pnum }">수정</a>
					<br />
					<a class="btn btn-outline-danger btn-sm" href="${ pageContext.request.contextPath }/admin_product_delete.do?pnum=${ dto.pnum }">삭제</a>
				</td>
			</tr>
			</c:forEach>
		</c:if>
	</table>
	
	<jsp:include page="../include/admin_bottom.jsp" />
</body>
</html>