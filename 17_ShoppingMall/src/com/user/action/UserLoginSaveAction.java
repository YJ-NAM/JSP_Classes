package com.user.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.controller.Action;
import com.shop.controller.ActionForward;
import com.shop.model.UserDAO;
import com.shop.model.UserDTO;

public class UserLoginSaveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// user_Id/user_pwd 정보 받아 회원 여부 확인 후 로그인 
		
		String user_id = request.getParameter("user_id").trim();
		String user_pwd = request.getParameter("user_pwd").trim();
		
		UserDAO dao = UserDAO.getInstance();
		int check = dao.userCheck(user_id, user_pwd);
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(check > 0) { // 회원인 경우
			UserDTO dto = dao.getMember(user_id);
			HttpSession session = request.getSession();
			session.setAttribute("userId", dto.getMemid());
			session.setAttribute("userName", dto.getMemname());
			forward.setRedirect(true);
			forward.setPath("user_main.do");	
		}else if(check == -1) { // 비번 틀린 경우	
			out.println("<script> alert('비밀번호를 다시 확인해주세요.'); history.back(); </script>");
		}else { // 회원이 아닌 경우
			out.println("<script> alert('아이디를 다시 확인해주세요.'); history.back(); </script>");
		}		
		return forward;
	}
}
