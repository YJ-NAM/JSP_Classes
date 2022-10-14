<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/admin_top.jsp" />
	<hr />
	<h4><b>상품 등록 페이지</b></h4>
	<hr />

	<form method="post" enctype="multipart/form-data"
		action="${ pageContext.request.contextPath }/admin_product_input_save.do">
	<table class="table">
		<tr class="align-middle">
			<th>상품명</th>
			<td>
				<input class="form-control" type="text" name="p_name" placeholder="상품명"/>
			</td>
		</tr>
		<tr class="align-middle">
			<th>카테고리 코드</th>
			<td>
				<select name="p_category" class="form-select">
					<c:if test="${ empty categoryList }">
						<option value="">::: No data :::</option>
					</c:if>
					<c:if test="${ !empty categoryList }">
						<c:forEach items="${ categoryList }" var="dto">
						<option value="${ dto.category_code }">[${ dto.category_name }] ${ dto.category_code } </option>
						</c:forEach>
					</c:if>
				</select>
			</td>
		</tr>
		<tr class="align-middle">
			<th>제조사</th>
			<td>
				<input class="form-control" type="text" name="p_company" placeholder="제조사"/>
			</td>
		</tr>
		<tr class="align-middle">
			<th>상품 이미지</th>
			<td>
				<input class="form-control" type="file" name="p_image" />
			</td>
		</tr>	
		<tr class="align-middle">
			<th>Qty</th>
			<td>
				<input class="form-control" type="number" name="p_qty" min="1" max="100" value="1" />
			</td>
		</tr>
		<tr class="align-middle">
			<th>가격</th>
			<td>
				<input class="form-control" type="number" name="p_price" maxlength="8" placeholder="가격" />
			</td>
		</tr>	
		<tr class="align-middle">
			<th>사양</th>
			<td>
				<select name="p_spec" id="" class="form-select">
					<option value="none" selected>일반</option>
					<option value="hit">인기</option>
					<option value="new">신상</option>
					<option value="recommend">추천</option>
				</select>
			</td>
		</tr>		
		<tr class="align-middle">
			<th>제품 소개</th>
			<td>
				<textarea rows="7" cols="25" name="p_content" class="form-control" placeholder="제품 소개"></textarea>
			</td>
		</tr>			
		<tr class="align-middle">
			<th>상품 포인트</th>
			<td>
				<input class="form-control" name="p_point" placeholder="포인트" />
			</td>
		</tr>
		<tr class="align-middle">
			<td colspan="2" align="center">
				<input class="btn btn-primary btn-md" type="submit" value="등록하기" />&nbsp;&nbsp;
				<input class="btn btn-warning btn-md" type="reset" value="초기화" />
			</td>
		</tr>
		</table>
	</form>
	<jsp:include page="../include/admin_bottom.jsp" />
</body>
</html>