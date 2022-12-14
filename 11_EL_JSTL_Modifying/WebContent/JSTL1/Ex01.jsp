<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- prefix에 집어넣은 c:~ / prefix를 무엇을 쓰냐에 따라 밑에 따라 나오는 값이 달라짐
	그렇지만 c가 통용되고 있음~! -->
	
	<%--
		기본적인 JSTL 태그 ==> 출력 할 때는 EL 언어 사용
		
		1. 변수 선언 태그(set)
			<c:set var="변수명" value="값"></c:set>
			예) 	<c:set var="su" value="10">
				==> int su = 10;
			
				<c:set var="str" value="Hello">
				==> String str = "Hello";
			
		2. 출력 태그(out)
			<c:out value="변수명" />
			예) 	<c:out value="str"> ==> Hello
			
		3. 삭제 태그(remove)
			<c:remove var="변수명" />
			예) <c:remove var="str" />  // 변수 삭제가 아닌 변수에 담겨진 값이 삭제됨
		
		4. 조건 처리 태그(if문) ==> else문이 없음
			<c:if test="조건식" var="변수명" />
			
		5. 조건 처리 태그(choose문) ==> switch~case문과 유사함
			<c:choose>
				<c:when test="조건식1">
					조건식1이 참인 경우 실행 문장</c:when>
				<c:when test="조건식2">
					조건식2가 참인 경우 실행 문장</c:when>				
				<c:when test="조건식3">
					조건식3이 참인 경우 실행 문장</c:when>
				<c:when test="조건식4">
					조건식4가 참인 경우 실행 문장</c:when>
				<c:otherwise>
					상기 조건식 이외의 경우 실행 문장<c:otherwise>
			</c:choose>
		6. 반복문(forEach문) ==> for문과 유사함
			<c:forEach begin="시작값" end="끝값" step="증감값" var="변수명">
				반복 실행할 문장
			</c:forEach>
			
			<c:forEach items="객체명" var="변수명">
			// 개선된 for문과 유사함
	--%>
	
	<h2>JSTL의 기본적인 태그들</h2>
	<h3>
		<%-- 1. 변수 태그 --%>
		<c:set var="str" value="Hello JSTL!!!" />
		<c:set var="str1" value="10/2" />
		문자열로 값 인식 >>> <c:out value="${str1 }" /> <br />

		
		<hr>
		
		<%-- 2. 출력 태그(out) --%>
		JSTL 값 출력 >>> <c:out value="str" /> <br />
		JSTL 값 출력 >>> <c:out value="${str}" />
		
		<hr>
		
		<%-- 3. 삭제 태그(remove) --%>
		<c:remove var="str"/>
		
		삭제 후 값 출력 >>> <c:out value="${str}" /> <br />
		
		<%-- 4. 조건 처리 태그(if문) ==> else문 없음 --%>
		<c:if test="${10>5 }" var="k" />
		조건식 결과 >>> <c:out value="${k }" /> <br />
		
		<hr>
		
		<%-- 5. 조건 처리 태그(choose문)  --%>
		<%-- 학점 처리 작업 --%>
		<c:set var="grade" value="89" />
		
		<c:choose>
			<c:when test="${grade >= 90 }">
				결과 : A학점입니다.
			</c:when>
			<c:when test="${grade >= 80 }">
				결과 : B학점입니다.
			</c:when>
			<c:when test="${grade >= 70 }">
				결과 : C학점입니다.
			</c:when>
			<c:when test="${grade >= 60 }">
				결과 : D학점입니다.
			</c:when>
			<c:otherwise>결과 : F학점입니다.</c:otherwise>
		</c:choose>
		
		<hr>
		
		<%-- 6. 반복 처리(forEach문) --%>
		<%-- 반복문을 이용하여 1~10까지 출력해보자 --%>
		<c:forEach begin="1" end="10" var="i">
			${i }&nbsp;&nbsp;&nbsp;
		</c:forEach>
		
		<hr />
		
		<%-- <c:forEach items="객체명" var="변수명"> --%>
		<%
			String[] str = {"홍길동", "이순신", "유관순", "김유신", "세종대왕"};
			pageContext.setAttribute("List", str);
		
		%>
		
		결과 >>> <c:forEach items="${List }" var="k">
					${k }&nbsp;&nbsp;&nbsp;
				</c:forEach>
		
	</h3>

</body>
</html>