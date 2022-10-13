package com.board.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.BoardDTO;

public class BoardContentAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 상세정보 보기
		// get 방식으로 넘어온 글번호에 해당하는 게시글의 상세 내역을 DB에서 조회하여 
		// view page로 이동시키는 비지니스 로직
		
		int no = Integer.parseInt(request.getParameter("no"));
		int currentPage = Integer.parseInt(request.getParameter("page"));
		
		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO dto = dao.boardContentList(no);
		
		request.setAttribute("cont", dto);
		request.setAttribute("Page", currentPage);

	}

}
