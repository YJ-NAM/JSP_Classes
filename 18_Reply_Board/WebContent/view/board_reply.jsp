<%@page import="com.reply1.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	int reply_no = Integer.parseInt(request.getParameter("rno")); 
	BoardDAO dao = BoardDAO.getInstance();
	String str = dao.getReplyList(reply_no);
	out.println(str);
%>
<!-- ajax 로 넘어온 rno 변수 받아주기 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>