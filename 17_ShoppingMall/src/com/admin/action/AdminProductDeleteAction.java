package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.controller.Action;
import com.shop.controller.ActionForward;
import com.shop.model.ProductDAO;

public class AdminProductDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 제품번호에 해당하는 제품 삭제
		System.out.println("여기");
		int p_num = Integer.parseInt(request.getParameter("pnum"));
		ProductDAO dao = ProductDAO.getInstance();
		int check = dao.deleteProduct(p_num);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			forward.setRedirect(true);
			forward.setPath("admin_product_list.do");
		}else {
			out.println("<script> alert('상품 삭제 실패'); history.back(); </script>");
		}
		return forward;
	}

}
