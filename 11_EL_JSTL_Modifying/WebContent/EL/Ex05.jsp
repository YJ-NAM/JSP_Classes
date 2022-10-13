<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<% 
		int res = 45 + 171;
		pageContext.setAttribute("Res", res);
		request.setAttribute("R", 1000);
		session.setAttribute("S", 10000);
		application.setAttribute("A", 100000);
		
		request.getRequestDispatcher("Ex06.jsp").forward(request, response);

	%>
	<h3>
		결과 >>> <%= res %> <br />
		결과(EL) >>> ${Res } <br />
		<!-- pageContext.getAttribute("Res", res); // 대신에 ${Res}만 써도 됨 -->
	</h3>
	
</body>
</html>