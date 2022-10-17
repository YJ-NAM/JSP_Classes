package com.user.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.controller.Action;
import com.shop.controller.ActionForward;
import com.shop.model.ProductDAO;
import com.shop.model.ProductDTO;

public class UserCategoryListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// get 방식으로 넘어온 카테고리 코드에 해당하는 제품 리스트를 조회하여 view page로 이동
		
		String p_code = request.getParameter("code").trim();
		ProductDAO dao = ProductDAO.getInstance();
		List<ProductDTO> list = dao.getProductList(p_code);
		request.setAttribute("productList", list); // 해당 코드에 대한 list 출력됨 
		// 변수명 같게 해서 전체리스트 출력과 코드에 따른 리스트 출력이 같이 이루어지게 함~!
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("user/user_main.jsp");
		
		return forward;
	}

}
