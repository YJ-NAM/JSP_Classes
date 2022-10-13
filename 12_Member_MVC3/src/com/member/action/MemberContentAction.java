package com.member.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

public class MemberContentAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 회원별 상세내역 조회
		// get 방식으로 넘어온 회원정보에 해당하는 회원의 정보를 view page로 이동시키는 비지니스 로직
		
		int no = Integer.parseInt(request.getParameter("num"));
		
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = dao.contentMember(no);
		
		request.setAttribute("contentDTO", dto);
		
		return "view/member_content.jsp";
	}

}
