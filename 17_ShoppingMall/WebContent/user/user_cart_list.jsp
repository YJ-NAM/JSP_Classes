<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/user_top.jsp" />
		<table class="table">
			<tr>
				<td colspan="7">
					<h3>장바구니 보기</h3>
				</td>
			</tr>
			<tr class="table-light">
				<th class="col-1">주문번호</th>
				<th class="col-1">상품번호</th>
				<th class="col-2">상품명</th>
				<th class="col-1">수량</th>
				<th class="col-1">단가</th>
				<th class="col-1">합계액</th>
				<th class="col-1">삭제</th>
			</tr>
			<c:if test="${ !empty cartList }">
				<c:forEach items="${ cartList }" var="dto" >
					<tr>
						<td>${ dto.cart_num }</td>
						<td>${ dto.cart_pnum }</td>
						<td>
							<p class="w-40 h-40">
							<img src="${ pageContext.request.contextPath }/upload/${ dto.cart_pimage }" alt="" />
							</p>
							${ dto.cart_pname }
						</td>
						<td>${ dto.cart_pqty }</td>
						<td><fmt:formatNumber value="${ dto.cart_price }" />원</td>
						<td>
							<c:set var="danga" value="${ dto.cart_price }" />
							<c:set var="amount" value="${ dto.cart_pqty }" />
							<fmt:formatNumber value="${ danga * amount}" />원
						</td>
						<td>
						<a href="${ pageContext.request.contextPath }/user_cart_delete.do?num=${ dto.cart_num }">삭제</a>
						</td>
						<c:set var="total" value="${ total + (danga * amount) }" />
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4" align="right">
						<b><font color="red">장바구니 총액 : <fmt:formatNumber value="${ total }" />원 </font></b>
					</td>
					<td colspan="3" align="center">
						<a href="#">[결제하기]</a>&nbsp;&nbsp;&nbsp;
						<a href="javascript:history.go(-2);">[계속 쇼핑하기]</a>
					</td>
				</tr>
			</c:if>
			<c:if test="${ empty cartList }">
				<tr>
					<td colspan="7" align="center">
						<h6>장바구니가 비어 있습니다...</h6>
					</td>
				</tr>
			</c:if>
		</table>
	<jsp:include page="../include/user_bottom.jsp" />
</body>
</html>