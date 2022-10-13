package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.BoardDTO;

public class BoardWriteAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 게시글 등록
		
		String[] board = request.getParameterValues("board");
		
		BoardDTO dto = new BoardDTO();
		dto.setBoard_writer(board[0].trim());
		dto.setBoard_title(board[1].trim());
		dto.setBoard_cont(board[2].trim());
		dto.setBoard_pwd(board[3].trim());
		
		BoardDAO dao = BoardDAO.getInstance();
		PrintWriter out = response.getWriter();
		int res = 0;
		
		if(!request.getParameter("no").equals("null") && !request.getParameter("page").equals("null")) { // 수정할 때
			
			int no = Integer.parseInt(request.getParameter("no"));
			int page = Integer.parseInt(request.getParameter("page"));
			res = dao.updateBoard(no, dto);
			
			if(res > 0) {
				out.println("<script> alert('글 수정 성공!'); location.href='board_content.do?no="+no+"&page="+page+"'; </script>");
			}else {
				out.println("<script> alert('글 수정 실패!'); history.back(); </script>");
			}
			
		}else {
			res = dao.insertBoard(dto);
			
			if(res > 0) {
				out.println("<script> alert('글 등록 성공!'); location.href='board_list.do'; </script>");
			}else {
				out.println("<script> alert('글 등록 실패!'); history.back(); </script>");
			}
		}
		
	}

}
