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
	<jsp:include page="../include/admin_top.jsp" />
	<hr />
	<h4>${ dto.pname } 제품 수정 페이지</h4>
	<hr />
	<br />
	
	<form action="${ pageContext.request.contextPath }/admin_product_modify_save.do" enctype="multipart/form-data" method="post">
	<input type="hidden" name="p_num" value="${ dto.pnum }" />
	<table class="table align-middle">
		<tr>
			<th>이름</th>
			<td><input type="text" class="form-control" name="p_name" value="${ dto.pname }" /></td>
		</tr>
		<tr>
			<th>카테고리 코드</th>
			<td><input type="text" class="form-control" name="p_category" value="${ dto.pcategory_fk }" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>제조사</th>
			<td><input type="text" class="form-control" name="p_company" value="${ dto.pcompany }" readonly="readonly"/></td>
		</tr>
		<tr>
			<th>이미지</th>
			<td>
				<input type="hidden" name="p_image_old" value="${ dto.pimage }" />
				<c:if test="${ !empty dto.pimage }"> <!-- 기존 이미지 있으면 -->
					<p><img src="${ pageContext.request.contextPath }/upload/${ dto.pimage }" class="w-50 h-50" alt="" /></p>
				</c:if>
				<input type="file" class="form-control" name="p_image_new" />
				<%-- 이미지를 수정하지 않고 그대로 제품수정 버튼을 누를 시 
				등록 이미지를 그대로 사용해서 히든으로 넘겨줄 예정 --%>
			</td>
		</tr>
		<tr>
			<th>수량</th>
			<td><input type="number" class="form-control" name="p_qty" min="1" max="100" value="${ dto.pqty }" /></td>
		</tr>
		<tr>
			<th>가격</th>
			<td><input type="text" class="form-control" name="p_price" value="${ dto.price }" /></td>
		</tr>	
		<tr>
			<th>분류</th>
			<td>
				<select name="pspec" id="" class="form-select">
					<option value="none" <c:if test="${ dto.pspec eq 'none' }">selected="selected"</c:if>>일반</option>
					<option value="hit" <c:if test="${ dto.pspec eq 'hit' }">selected="selected"</c:if>>인기</option>
					<option value="new" <c:if test="${ dto.pspec eq 'new' }">selected="selected"</c:if>>신상</option>
					<option value="recommend" <c:if test="${ dto.pspec eq 'recommend' }">selected="selected"</c:if>>추천</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>제품 소개</th>
			<td><textarea name="p_content" class="form-control" id="" cols="25" rows="7"></textarea></td>
		</tr>							
		<tr>
			<th>포인트</th>
			<td><input type="text" class="form-control" name="p_point" value="${ dto.point }" /></td>
		</tr>	
		<tr>
			<td colspan="2">
			<input type="submit" class="btn btn-outline-success" value="수정하기" />&nbsp;
			<input type="reset" class="btn btn-outline-warning" value="초기화" />
			</td>
		</tr>
	</table>
	</form>
	<jsp:include page="../include/admin_bottom.jsp" />


</body>
</html>