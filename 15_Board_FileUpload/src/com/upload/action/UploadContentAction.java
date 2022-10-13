package com.upload.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.upload.model.UploadDAO;
import com.upload.model.UploadDTO;

public class UploadContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 게시물 상세 내역 조회
		
		int upload_no = Integer.parseInt(request.getParameter("no").trim());
		
		UploadDAO dao = UploadDAO.getInstance();
		
		// 조회수 증가 + 상세내역 조회
		dao.hitCount(upload_no);
		UploadDTO content = dao.uploadContent(upload_no);
		
		ActionForward forward = new ActionForward();
		request.setAttribute("dto", content);
		forward.setRedirect(false);
		forward.setPath("view/upload_content.jsp");
		
		return forward;
	}
	

}
