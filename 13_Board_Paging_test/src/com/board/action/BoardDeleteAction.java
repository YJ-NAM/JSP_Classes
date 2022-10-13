package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;

public class BoardDeleteAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 글 삭제
		
		int no = Integer.parseInt(request.getParameter("no"));
		BoardDAO dao = BoardDAO.getInstance();
		PrintWriter out = response.getWriter();
		
		int res = dao.deleteBoard(no);
		
		if(res > 0) {
			out.println("<script> alert('성공적으로 삭제되었습니다.'); location.href='board_list.do'; </script>");
		}else {
			out.println("<script> alert('삭제 실패!'); history.back(); </script>");
		}	
	}
}
