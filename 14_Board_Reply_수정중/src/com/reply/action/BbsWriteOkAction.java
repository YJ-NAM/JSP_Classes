package com.reply.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.reply.model.BbsDAO;
import com.reply.model.BbsDTO;

public class BbsWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 게시글 작성 폼 페이지에서 넘어온 데이터들을 DB에 저장하는 비지니스 로직.
		
		int res = 0;
		BbsDTO dto = new BbsDTO();
		BbsDAO dao = BbsDAO.getInstance();
		ActionForward forward = new ActionForward();
		
		
		String bbs_pwd = request.getParameter("pwd").trim(); // 비밀번호 대조 위한 변수 선언
		
		dto.setBoard_writer(request.getParameter("writer").trim());
		dto.setBoard_title(request.getParameter("title").trim());
		dto.setBoard_cont(request.getParameter("content").trim());
		dto.setBoard_pwd(bbs_pwd);
		
		HttpSession session = request.getSession();
		
		if(request.getParameter("no").equals("null") || request.getParameter("no").equals("")) { // 등록
			res = dao.insertBbs(dto);			
			if(res > 0) {
				session.setAttribute("errMsg", "<script> alert('게시물 등록 성공!'); </script>");
				System.out.println(request.getAttribute("errMsg"));
				forward.setRedirect(true);
				forward.setPath("bbs_list.do");
			}else {
				request.setAttribute("errMsg", "<script> alert('게시물 등록 실패!'); </script>");
				forward.setRedirect(false);
				forward.setPath("view/bbs_write.jsp");
			}				
		}else { // 수정
			
			System.out.println("뜨는거야뭐야"+request.getParameter("no"));
			int no = Integer.parseInt(request.getParameter("no"));
			dto.setBoard_no(no);
			
			res = dao.updateBoard(dto);				
			if(res > 0) {
				session.setAttribute("errMsg", "<script> alert('게시물 수정 성공'); </script>");
				forward.setRedirect(true);
				forward.setPath("bbs_content.do?no="+no);
			}else {
				request.setAttribute("errMsg", "<script> alert('게시물 수정 실패'); </script>");
				forward.setRedirect(false);
				forward.setPath("bbs_write.do?no="+no);
			}
						
		}		
		return forward;	//리스트 페이지로 이동
	}
}
