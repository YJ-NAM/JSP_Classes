package com.upload.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.upload.model.UploadDAO;
import com.upload.model.UploadDTO;

public class UploadDeleteOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 삭제 기능
		
		String upload_pwd = request.getParameter("pwd").trim(); // 삭제 창에서 입력한 비번
		int upload_no = Integer.parseInt(request.getParameter("no"));
		
		UploadDAO dao = UploadDAO.getInstance();
		UploadDTO dto = dao.uploadContent(upload_no);
		
		String upload = "C:\\NCS\\workspace(jsp)\\15_Board_FileUpload\\WebContent\\upload";
		String fileName = dto.getUpload_file();
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		if(upload_pwd.equals(dto.getUpload_pwd())) { // 비밀번호 맞는 경우
			int res = dao.deleteUpload(upload_no);
			if(fileName != null) { // 첨부파일이 존재하는 경우
				File file = new File(upload + fileName);
				file.delete();
			}
			if(res > 0) {
				session.setAttribute("errMsg", "<script> alert('게시물 삭제 성공!'); </script>");
				forward.setRedirect(true);
				forward.setPath("upload_list.do");
			}else {
				out.println("<script> alert('삭제 실패!'); history.go(-1); </script>");
			}
		}else { // 비밀번호 틀린 경우
			out.println("<script> alert('비밀번호를 다시 확인해주세요'); history.go(-1); </script>");
		}		
		return forward;
	}

}
