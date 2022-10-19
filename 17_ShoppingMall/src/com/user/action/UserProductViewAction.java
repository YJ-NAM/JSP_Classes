package com.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.controller.Action;
import com.shop.controller.ActionForward;
import com.shop.model.ProductDAO;
import com.shop.model.ProductDTO;

public class UserProductViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// get 방식으로 넘어온 제품번호에 해당하는 제품 상세 정보 조회 후 view page로 이동
		
		int pnum = Integer.parseInt(request.getParameter("pnum"));
		ProductDAO dao = ProductDAO.getInstance();
		
		ProductDTO dto = dao.productContent(pnum);
		
		ActionForward forward = new ActionForward();
		
		request.setAttribute("productCont", dto);
		
		forward.setRedirect(false);
		forward.setPath("user/user_product_detail.jsp");
		
		return forward;
	}

}
