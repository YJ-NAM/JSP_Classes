package com.member.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.action.*;

public class FrontController extends HttpServlet {

	/**
	 * private static final long serialVersionUID = 1L;
	 * protected void service(HttpServletRequest request, HttpServletResponse response) {
	 * }
	 * 이렇게까지 생성하면 서블릿 하나 만들어진 것!
	 */
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 한글 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command1 = request.getRequestURI().replace(request.getContextPath()+"/", "");
		
		// getRequestURI() : "/프로젝트명/파일명(*.do)"라는 문자열을 반환해주는 메서드
		// http://localhost:8282/12_Member_MVC2/*.do
		String uri = request.getRequestURI();
		
		// getContextPath() : 현재 프로젝트명을 문자열로 반환해주는 메서드
		String path = request.getContextPath();

		String command = uri.substring(path.length() + 1);
		// uri.replace(request.getContextPath()+"/", ""); 동진님 추천 코드
		
		Action action = null;
		
		if(command1.equals("select.do")) {
			action = new MemberListAction();
		}else if(command1.equals("insert.do")) {
			action = new MemberJoinAction();
		}else if(command1.equals("insert_ok.do")) {
			action = new MemberJoinOkAction();
		}else if(command1.equals("content.do")) {
			action = new MemberContentAction();
		}else if(command1.equals("delete.do")) {
			action = new MemberDeleteAction();
		}
		
		// path1 = "view/member_list.jsp";
		// path1 = view/member_join.jsp -> 이런 식으로 위의 if문 실행결과에 따라 어느 view page로 갈지 결정됨
		if(action.execute(request, response) != "hateNull") {
			String path1 = action.execute(request, response);
			request.getRequestDispatcher(path1).forward(request, response);
		}
	}

}
