<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%--
		포맷팅 라이브러리 종류
		- <fmt:formatNumber> : 표시할 숫자의 형식을 지정하는 태그
		- <fmt:timeZone> : 지정한 국가의 시간을 지정하는 태그
						   태그를 열고 닫는 영역에서만 적용됨
		- <fmt:setTimeZone> : 지정한 국가의 시간을 지정하는 태그
		- <fmt:formatDate> : 지정한 형식의 날짜를 표시하는 태그	
	 --%>
	 
	 <%--
	 	<fmt:formatNumber> 태그의 여러가지 속성
	 	- value : 출력 형식 지정
	 	- type : 출력될 타입 지정
	 	  * percent : %
	 	  * number : 숫자
	 	  * currency : 통화 형식
	 	- currencyCode : 통화 코드를 지정 / 한국 원화는 KRW임
	 	- currencySymbol : 통화를 표시할 때 사용할 기호 표시
	 	- var : <fmt:formatNumber> 태그의 결과를 저장할 변수의 이름 지정
	 	- scope : 변수의 접근 범위 지정
	 	- pattern : 숫자가 출력될 양식 지정
	 --%>
	 
	 <div align="center">
	 	<hr width="50%" color="gray"/>
	 	<h3>커피 주문 폼 페이지</h3>
	 	<hr width="50%" color="gray"/>
	 	<br />
	 	
	 	<form action="Ex03.jsp" method="post">
	 		<table border="1" cellspacing="0" width="300">
	 			<tr>
	 				<th>커피 종류</th>
	 				<td>
	 					<select name="coffee_str">
	 						<option value="1">아메리카노 - 3,000원</option>
	 						<option value="2">카페라떼 - 4,000원</option>
	 						<option value="3">카푸치노 - 4,500원</option>
	 						<option value="4">카라멜 마끼아또 - 4,500원</option>	 					
	 					</select>
	 				</td>
	 			</tr>
	 			<tr>
	 				<th>수량</th>
	 				<td>
	 					<input type="number" min="1" max="20" name="su"/>
	 				</td>
	 			</tr>
	 			<tr>
	 				<td colspan="2" align="center">
	 					<input type="submit" value="주문" />&nbsp;&nbsp;
	 					<input type="reset" value="취소" />
	 				</td>
	 			</tr>
	 		</table>
	 	</form>
	 </div>
</body>
</html>