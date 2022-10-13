<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- JSTL 언어를 사용하겠다는 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 포맷팅 라이브러리를 사용하겠다는 선언 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%-- String coffee = request.getParameter("coffee_str").trim() --%>
	<c:set var="coffee" value="${param.coffee_str }" />
	
	<c:choose>
		<c:when test="${coffee == 1 }">
			<c:set var="coffee_str1" value="아메리카노" />
			<c:set var="price" value="3000" />
		</c:when>
		<c:when test="${coffee == 2 }">
			<c:set var="coffee_str1" value="카페라떼" />
			<c:set var="price" value="4000" />
		</c:when>
		<c:when test="${coffee == 3 }">
			<c:set var="coffee_str1" value="카푸치노" />
			<c:set var="price" value="4500" />
		</c:when>
		<c:when test="${coffee == 4 }">
			<c:set var="coffee_str1" value="카라멜 마끼아또" />
			<c:set var="price" value="4500" />
		</c:when>
	</c:choose>
	<div align="center">
	    <br />
        <hr width="50%" color="gray" />
        <h3>커피 주문 결과</h3>
        <hr width="50%" color="gray" />
        <br />
	
		<table border="1" cellspacing="0" width="350">
			<tr>
				<th>커피 종류</th>
				<td>${coffee_str1 }</td>
			</tr>
			<tr>
				<th>커피 단가</th>
				<td> <fmt:formatNumber value="${price }" /> 원</td>
			</tr>	
			<tr>
				<th>커피 수량</th>
				<c:set var="amount" value="${param.su }" />
				<td> ${amount }</td>
			</tr>	
			<tr>
				<th>공급가액</th>
				<!-- 여기서 사용하기 위해 위에서 amount 변수 지정 -->
				<td> <fmt:formatNumber value="${price * amount }" /></td>
			</tr>	
			<tr>
				<th>부가세액</th>
				<td> <fmt:formatNumber value="${(price * amount)*0.1 }" /></td>
			</tr>				
			<tr>
				<th>총금액</th>
				<td> <fmt:formatNumber value="${(price * amount)*1.1 }" /></td>
			</tr>			
		</table>
	</div>
</body>
</html>