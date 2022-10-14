package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.controller.Action;
import com.shop.controller.ActionForward;
import com.shop.model.AdminDAO;
import com.shop.model.AdminDTO;

public class AdminLoginSaveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 관리자 로그인 창에서 입력한 관리자 아이디와 비번이 DB의 아이디, 비번과 일치하는지 확인하는 로직
		
		String admin_id = request.getParameter("admin_id").trim();
		String admin_pwd = request.getParameter("admin_pwd").trim();
		
		AdminDAO dao = AdminDAO.getInstance();
		int check = dao.adminCheck(admin_id, admin_pwd); // 0(다틀림), -1(비번틀림), 1(성공) 값이 들어올 수 있음
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		// 세션을 설정하는 방법
		// request.getSession() 
		// ==> HttpSession 존재 시 현재 HttpSession을 반환하고, 존재 x 시 세션 생성하는 메서드
		HttpSession session = request.getSession();
		
		if(check > 0) { 
			// 관리자인 경우, 관리자 정보 받기
			AdminDTO dto = dao.getAdmin(admin_id);
			// 세션에 저장~!
			session.setAttribute("adminInfo", dto);
			
			
		}else if(check == -1) { // 비번 틀린 경우
			
		}else { // 둘 다 틀린 경우
			
		}
		
		forward.setPath(path);
		forward.setRedirect(isRedirect);
		
		return forward;
	}

}
