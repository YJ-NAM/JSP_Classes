package com.upload.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.upload.model.UploadDAO;
import com.upload.model.UploadDTO;

public class UploadListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 전체 record 조회
		
		UploadDAO dao = UploadDAO.getInstance();
		List<UploadDTO> list =  dao.getUploadList();
				
		request.setAttribute("list", list);	
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("view/upload_list_DJ.jsp");
		
		return forward;
	}

}
