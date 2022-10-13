package com.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

public class MemberListAction implements Action {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// MEMBER10 테이블에 있는 회원 전체 리스트를 조회하여 view page로 이동시키는 비지니스 로직
		// Action 인터페이스 상속 받은 MemberListAction에서 action의 execute 추상 메서드 오버라이딩
		
		MemberDAO dao = MemberDAO.getInstance();
		List<MemberDTO> memberList = dao.getMemberList();
		
		// DB에서 가져온 전체 회원 리스트를 view page로 이동시켜야 함
		request.setAttribute("List", memberList);
		
		return "view/member_list.jsp";
	}

}
