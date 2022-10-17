package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.controller.Action;
import com.shop.controller.ActionForward;
import com.shop.model.ProductDAO;
import com.shop.model.ProductDTO;

public class AdminProductModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// get 방식으로 넘어온 제품번호에 해당하는 제품의 상세내역을 DB에서 조회 후 수정 폼 페이지로 이동

		int product_num = Integer.parseInt(request.getParameter("pnum"));
		ProductDAO dao = ProductDAO.getInstance();
		
		ProductDTO dto = dao.productContent(product_num);
		request.setAttribute("dto", dto);  // 수정하기에 넘길 정보
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("admin/admin_product_modify.jsp");
		
		return forward;
	}

}
