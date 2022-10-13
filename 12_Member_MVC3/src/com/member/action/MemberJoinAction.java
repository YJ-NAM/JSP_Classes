package com.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

public class MemberJoinAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 회원 등록 폼 페이지로 이동하는 비지니스 로직
		
		if(request.getParameter("num") != null) {
			
			int member_no = Integer.parseInt(request.getParameter("num"));
			
			MemberDAO dao = MemberDAO.getInstance();
			MemberDTO dto = dao.contentMember(member_no);
			
			request.setAttribute("Modify", dto);
		}
		
		return "view/member_join.jsp";
	}

}
