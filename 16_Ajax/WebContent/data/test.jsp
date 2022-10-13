<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
String req_param = request.getParameter("param").trim();

System.out.println("요청한 param >>> "+req_param);

// 응답 필요
out.println("Ajax 요청에 대한 응답입니다.");

%>