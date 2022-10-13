package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

public class MemberJoinOkAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 회원 등록 폼 페이지에서 넘어온 데이터들을 MEMBER10 테이블에 회원으로 등록하는 비지니스 로직
		
		String[] member = request.getParameterValues("member");
		PrintWriter out = response.getWriter();
		int res = 0;
		// 1단계 : 회원등록 폼 페이지에서 넘어온 데이터들을 받아주자		
		// 2단계 : 회원 등록 폼 페이지에서 넘어온 데이터들을 DTO 객체의 setter() 메서드를
		// 인자로 넘겨주어서 멤버변수에 초기값을 할당해주자		
		
		// 3단계 : DTO 객체를 DAO 객체의 호출 메서드의 인자로 넘겨서 MEMBER10 테이블의 회원으로 저장하자
		
		MemberDTO dto = new MemberDTO();
		dto.setMemid(member[0].trim());
		dto.setMemname(member[1].trim());
		dto.setPwd(member[2].trim());
		dto.setAge(Integer.parseInt(member[3].trim()));
		dto.setMileage(Integer.parseInt(member[4].trim()));
		dto.setJob(member[5].trim());
		dto.setAddr(member[6].trim());
		
		MemberDAO dao = MemberDAO.getInstance();
		int no = Integer.parseInt(request.getParameter("num"));
		
		if(no != 0) { // 수정할 때 			
			dto.setNum(no);
			res = dao.updateMember(dto);						
			if(res > 0) {
				out.print("<script>alert('성공적으로 수정되었습니다.'); location.href='content.do?num="+dto.getNum()+"'; </script>");
			}else {
				out.print("<script>alert('수정이 실패했습니다.'); history.back(); </script>");
			}			
		}else { // 새로 글 등록할 때
			res = dao.insertMember(dto);
			if(res > 0) {
				out.print("<script>alert('성공적으로 등록되었습니다.'); location.href='select.do'; </script>");
			}else {
				out.print("<script>alert('등록이 실패했습니다.'); history.back(); </script>");
			}
		}
		return "hateNull";
	}
}
