package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.controller.Action;
import com.shop.controller.ActionForward;

public class AdminLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 로그아웃 글씨 클릭 시 모든 정보(session)를 종료시켜 주는 비지니스 로직
		
		HttpSession session = request.getSession();
		
		// 현재 사용중인 모든 세션을 종료시키는 메서드
		session.invalidate();
		
		ActionForward forward = new ActionForward();
		request.setAttribute("logoutMsg", "<script> alert('로그아웃 되었습니다.'); </script>");
		forward.setRedirect(false);
		forward.setPath("main.jsp");
		
		return forward;
	}

}
