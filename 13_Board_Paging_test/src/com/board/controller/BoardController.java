package com.board.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.action.*;

public class BoardController extends HttpServlet {

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
		
		String command = request.getRequestURI().replace(request.getContextPath()+"/", "");
		
		BoardAction action = null;
		String viewPage = null;
		
		if(command.equals("board_list.do")) { // 전체 리스트 조회
			action = new BoardListAction();
			action.execute(request, response);
			viewPage = "view/board_list.jsp";
		}else if(command.equals("board_write.do")) { // 글 등록 & 글 수정 form
			if(request.getParameter("no") == null) { // 글 등록
				viewPage = "view/board_write.jsp";
			}else { // 글 수정
				request.setAttribute("no", request.getParameter("no"));
				request.setAttribute("page", request.getParameter("page"));
				action = new BoardContentAction(); // 상세 정보 조회 메서드로 dto 값 받기~!
				action.execute(request, response);
				viewPage = "view/board_write.jsp";
			}
		}else if(command.equals("board_write_ok.do")) { // 글 등록 & 글 수정 값 입력 
			action = new BoardWriteAction();
			action.execute(request, response);
		}else if(command.equals("board_content.do")) { // 상세 정보 조회 
			action = new BoardContentAction();
			action.execute(request, response);
			viewPage = "view/board_content.jsp";
		}else if(command.equals("board_delete.do")) { // 글 삭제
			action = new BoardDeleteAction();
			action.execute(request, response);
		}else if(command.equals("board_search.do")) { // 검색 기능
			action = new BoardSearchAction();
			action.execute(request, response);
			viewPage = "view/board_list.jsp";
		}
		
		if(viewPage != null) { // null 처리 위한 if문~! 룰루
			request.getRequestDispatcher(viewPage).forward(request, response);
		}
	}

}
