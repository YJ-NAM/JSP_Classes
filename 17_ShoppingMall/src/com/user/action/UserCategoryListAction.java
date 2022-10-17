package com.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.controller.Action;
import com.shop.controller.ActionForward;
import com.shop.model.ProductDAO;

public class UserCategoryListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// get 방식으로 넘어온 카테고리 코드에 해당하는 제품 리스트를 조회하여 view page로 이동
		
		String p_code = request.getParameter("code").trim();
		ProductDAO dao = ProductDAO.getInstance();
		dao.getProductList(p_code);
		
		return null;
	}

}
