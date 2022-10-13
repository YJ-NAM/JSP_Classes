package com.board.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.BoardDTO;

public class BoardSearchAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 검색 폼 페이지에서 넘어온 데이터를 가지고 검색어에 해당하는 게시물들을 DB에서 조회하여 
		// view page로 이동시키는 비지니스 로직
		
		String search = request.getParameter("search");
		String keyword = request.getParameter("keyword").trim().toLowerCase();
				
		int rowsize = 5; // 한 페이지 게시물 개수
		int block = 3; // 블럭 개수
		int totalRecord = 0; // 전체 게시물 개수(검색에선 검색 게시물 개수)
		int allPage = 0; // 전체 페이지
		int page = 1; // 현재 페이지
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page").trim());
		} // else 없이 현재 페이지 기본값 1 설정
		
		/*
		 * 2 page -> 11~20 
		 * 1 page -> 1~10 rowsize 10
		 */
		
		// 해당 페이지에서 시작 번호
		int startNo = (page * rowsize) - (rowsize - 1);
		
		// 해당 페이지에서 끝 번호
		int endNo = (page * rowsize);
		
		// 해당 페이지에서 시작 블럭 // block -> 보여질 최대 블럭수 [1]
		int startBlock = (((page - 1) / block) * block) + 1;
		// 계산 시 int 타입임 감안!
		
		// 해당 페이지에서 끝 블럭 [3]
		int endBlock = (((page - 1) / block) * block) + block;

		// DB 상 검색 게시물의 수를 확인하는 메서드 호출
		BoardDAO dao = BoardDAO.getInstance();
		totalRecord = dao.searchListCount(search, keyword); // 검색된 전체 게시물 수 저장~!
		
		allPage = (int)Math.ceil(totalRecord / (double)rowsize); // 전체 페이지 수 구하는 변수
		
		if(endBlock > allPage) {
			endBlock = allPage;
		}
		
		// 검색한 내용을 가지고 해당 페이지 게시물을 가져오는 메서드
		List<BoardDTO> list = dao.searchBoard(search, keyword, startNo, endNo);
		
		// 지금까지 페이징 처리 시 작업했던 모든 값들을 view page로 이동시키자
		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("allPage", allPage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);				
		request.setAttribute("search", search);
		request.setAttribute("keyword", keyword);
		request.setAttribute("List", list);
	}
}
