<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/user_top.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="dto" value="${ProductInfo}" />
<fmt:formatNumber value="${dto.getPrice()}" var="showPrice" />


<div class="contents goods-detail">
    <form name="frm" method="post">
    <input type="hidden" name="pnum" value="${dto.getPnum()}" />
    <input type="hidden" name="goods_price" value="${dto.getPrice()}" />
    <input type="hidden" name="goods_ea_total" value="${dto.getPqty()}" />
    <div class="gd-top">
        <div class="gdt-photo">
            <c:if test="${!empty dto.getPimage()}"><img src="<%=request.getContextPath()%>/upload/${dto.getPimage()}" alt="" /></c:if>
            <c:if test="${empty dto.getPimage()}">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="458" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: no img">
                <title>Placeholder</title>
                <rect width="100%" height="100%" fill="#eee"></rect>
                <text x="44%" y="50%" fill="#888" dy=".3em">no img</text>
            </svg>
            </c:if>
        </div>


        <div class="gdt-info">
            <h3 class="gdti-code">${dto.getPcompany()}</h3>
            <h2 class="gdti-name">${dto.getPname()}</h2>

            <div class="gdti-price"><b>${showPrice}</b>원</div>

            <ul class="gdti-delivery">
                <li>
                    <b>수량 : </b>
                    <c:if test="${dto.getPqty() > 0}">
                    <span class="quantity">
                        <input type="text" name="goods_ea" value="1" maxlength="5" onkeydown="ea_input(this);" />
                        <button type="button" class="up" onclick="ea_updown('up');"><i class="icon-arrow-up"></i></button>
                        <button type="button" class="down" onclick="ea_updown('down');"><i class="icon-arrow-down"></i></button>
                    </span>
                    </c:if>
                    <c:if test="${dto.getPqty() <= 0}">
                    <span class="text-secondary">품절</span>
                    </c:if>
                </li>
                <li><b>구매시 적립 : </b> <fmt:formatNumber value="${dto.getPoint()}" />점</li>
                <li><b>오후 2시 이전</b> 결제 시 당일발송</li>
            </ul>

            <div class="gdti-total">
                <span>총 상품 금액</span>
                <strong><b>${showPrice}</b>원</strong>
            </div>

            <div class="gdti-button">
                <c:if test="${dto.getPqty() > 0}">
                <button type="button" class="buy" onclick="#"><i class="icon-credit-card mr-1"></i> 구매하기</button>
                <button type="button" class="cart" onclick="goCart();"><i class="icon-basket-loaded mr-1"></i> 장바구니</button>
                </c:if>
                <c:if test="${dto.getPqty() <= 0}"><button type="button" class="soldout">SOLD OUT</button></c:if>
            </div>
        </div>
    </div>
    </form>



    <div class="gd-detail">
        ${showContents}
    </div>
</div>




<jsp:include page="../include/user_bottom.jsp" />