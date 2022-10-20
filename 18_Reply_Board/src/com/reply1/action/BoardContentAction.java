package com.reply1.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reply1.controller.Action;
import com.reply1.controller.ActionForward;
import com.reply1.model.BoardDAO;
import com.reply1.model.BoardDTO;

public class BoardContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 상세정보 조회
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO dto = dao.getBoardContent(no);
		
		request.setAttribute("cont", dto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("view/board_content.jsp");
		
		return forward;
	}

}
