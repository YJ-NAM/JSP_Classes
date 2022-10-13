package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;

public class MemberDeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 회원 삭제 
		
		int no = Integer.parseInt(request.getParameter("num"));
		MemberDAO dao = MemberDAO.getInstance();
		PrintWriter out = response.getWriter();
		
		int res = dao.deleteMember(no);
		
		if(res > 0) {
			out.print("<script>alert('성공적으로 삭제되었습니다.'); location.href='select.do'; </script>");
		}else {
			out.print("<script>alert('삭제 실패!'); history.back(); </script>");
		}
		return "hateNull";
	}

}
