package com.customer.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;

/**
 * Servlet implementation class SelectServlet
 */
@WebServlet("/select.do")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// customer 테이블에 있는 전체 고객 리스트 조회하는 비지니스 로직
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		MemberDAO dao = MemberDAO.getInstance();
		String str = dao.getCustomerList();
		
		// 반환된 고객정보를 클라이언트(ajax) 쪽으로 응답해주면 됨
		out.println(str);
	}

}
