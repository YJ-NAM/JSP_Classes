<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="time" value="${ System.currentTimeMillis() }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js?${ time }"></script>
</head>
<body>
	<jsp:include page="../include/user_top.jsp" />
	<h1 id="potter"><b>'Potter'</b></h1>
	<h6><i>The space you can take a rest</i></h6>
		<hr />
		<h5>Product Lists</h5>
		<hr />
		
		<div class="row row-cols-1 row-cols-md-3">
			<c:if test="${ empty productList }">
			<span>No data</span>
			</c:if>
			<c:if test="${ !empty productList }">
			<c:forEach items="${ productList }" var="dto" >
				<div class="col mb-4 text-bg-light mb-3">
			 		<div class="card" style="width: 1fr; height: 380px" >
					  <img src="${ pageContext.request.contextPath }/upload/${ dto.pimage }" class="card-img-top" alt="">
					  <div class="card-body">
					    <h5 class="card-title">${ dto.pname }</h5>
					    <p class="card-text">${ dto.pcontents }</p>
					    <p class="card-text"><b><fmt:formatNumber value="${ dto.price }"/>원</b>
					    <small id="point"><fmt:formatNumber value="${ dto.point }" var="commaPoint" /> [${ commaPoint }]포인트</small></p>
					    <a href="${ pageContext.request.contextPath }/user_product_view.do?pnum=${ dto.pnum }" class="btn btn-primary">상세정보</a>
					  </div>
					</div>
				</div>
			</c:forEach>
			</c:if>
		</div>
	<jsp:include page="../include/user_bottom.jsp" />
</body>
</html>