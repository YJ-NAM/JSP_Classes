package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shop.controller.Action;
import com.shop.controller.ActionForward;
import com.shop.model.ProductDAO;
import com.shop.model.ProductDTO;

public class AdminProductInputSaveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 상품 등록 폼에서 받은 데이터를 DB에 저장
		
		// 첨부파일이 저장될 위치(경로) 설정
		String saveFolder = "C:\\Users\\user1\\git\\JSP_Classes\\17_ShoppingMall\\WebContent\\uploadFile";
		
		// 첨부파일 용량(크기) 제한 - 파일 업로드 최대 크기
		int filesize = 10*1024*1024; // 10MB
		MultipartRequest multi = new MultipartRequest
				(request, saveFolder, filesize, "UTF-8", new DefaultFileRenamePolicy());
		
		// 넘어온 데이터 받아주기
		String p_name = multi.getParameter("p_name").trim();
		String p_category = multi.getParameter("p_category");
		String p_company = multi.getParameter("p_company").trim();
		int p_qty = Integer.parseInt(multi.getParameter("p_qty"));
		int p_price = Integer.parseInt(multi.getParameter("p_price").trim());
		String p_spec = multi.getParameter("p_spec");
		String p_content = multi.getParameter("p_content").trim();
		int p_point = Integer.parseInt(multi.getParameter("p_point").trim());
		
		// getFilesystemName()
		// ==> 업로드 된 파일 이름을 문자열로 반환해주는 메서드
		String p_image = multi.getFilesystemName("p_image"); 
		
		ProductDTO dto = new ProductDTO();
		dto.setPname(p_name);
		dto.setPcategory_fk(p_category);
		dto.setPcompany(p_company);
		dto.setPimage(p_image);
		dto.setPqty(p_qty);
		dto.setPrice(p_price);
		dto.setPspec(p_spec);
		dto.setPcontents(p_content);
		dto.setPoint(p_point);
		
		ProductDAO dao = ProductDAO.getInstance();
		int check = dao.insertProduct(dto);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			forward.setRedirect(true);
			forward.setPath("admin_product_list.do");
		}else {
			out.println("<script> alert('상품 등록 실패'); history.back(); </script>");
		}
		
		return forward;
	}

}
