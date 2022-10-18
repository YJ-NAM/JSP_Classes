<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	function goCart() {
		document.frm.action = "${ pageContext.request.contextPath }/user_cart_add.do";
		document.frm.submit();
	}
	
	/*  
	DJ's
	
	function goCart(){
	    var form = document.frm;
	
	    if(!form.goods_ea_total.value || form.goods_ea_total.value <= 0){
	        alert("품절상품은 구입 할 수 없습니다.");
	        return false;
	    }
	
	    form.action.value = "user_cart_add.do";
	
	    form.submit();
	    return;
	}
	
	*/
</script>
</head>
<body>
	<jsp:include page="../include/user_top.jsp" />
	<div id="nav-table">
	<table class="table" >
		<c:if test="${ !empty productCont }">
			<tr>
				<td colspan="2">
					<b>[${ productCont.pname }] 상품 정보</b>
				</td>
			</tr>
			<tr>
				<td>
					<img src="${ pageContext.request.contextPath }/upload/${ productCont.pimage }" alt="" />
				</td>
				<td>
					<form action="" method="post" name="frm">
						<input type="hidden" name="p_num" value="${ productCont.pnum }" />
						<input type="hidden" name="p_spec" value="${ productCont.pspec }" />
						<input type="hidden" name="p_image" value="${ productCont.pimage }" />
						<input type="hidden" name="userId" value="${ userId }" />
						<table align="right">
							<tr>
								<td colspan="2" ></td>
							</tr>						
							<tr>
								<th>No </th> <td>${ productCont.pnum }</td>
							</tr>
							<tr>
								<th>Name </th>
								<td><input class="form-control" name="p_name" value="${ productCont.pname }" readonly="readonly" type="text" /></td>
							</tr>						
							<tr>
								<th>Price </th>
								<td><input class="form-control" name="p_price" value="${ productCont.price }" readonly="readonly" type="text" /></td>
							</tr>														
							<tr>
								<th>Point </th>
								<fmt:formatNumber value="${ productCont.point }" var="commaPoint"/>
								<td>[${ commaPoint }] 포인트 </td>
							</tr>									
							<tr>
								<th>qty </th>
								<td><input class="form-control" type="number" name="p_qty" min="1" max="50" value="1"/></td>
							</tr>
							<tr>
								<td colspan="2" align="center" >
									<button type="button" class="iconBtn btn btn-primary" onclick="goCart()" >
									<span class="material-symbols-outlined">add_shopping_cart</span> 장바구니 담기</button>&nbsp;&nbsp;
									<button type="button" class="iconBtn btn btn-danger" onclick="goCart()" >
									<span class="material-symbols-outlined">payments</span> 결제하기</button>
								</td>							
							</tr>	
							<tr>
								<td colspan="2" height="10"></td>
							</tr>						
						</table>				
					</form>
				</td>
			</tr>
			<tr height="250" valign="top">
				<td colspan="2">
					<br />
					<b>제품 소개</b>
					<br /><br />
					${ productCont.pcontents }
				</td>
			</tr>	
		</c:if>		
	</table>
	</div>
	<jsp:include page="../include/user_bottom.jsp" />
</body>
</html>