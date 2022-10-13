package com.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.BoardDTO;

public class BoardListAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// DB에서 게시글 전체 리스트 조회하여 view page로 이동시키는 비지니스 로직
		// 비지니스 로직 수행 시 페이징 처리 작업 동시 진행
		
		
		int rowLength = 5;
		int blockNum = 3;
		int currentPage = 1;
		int totalNum = 0;
		int totalPage = 0;
		
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		// current Page의 시작 num
		int startNum = (rowLength * currentPage) - (rowLength - 1);
		// current Page의 마지막 num
		int lastNum = rowLength * currentPage;
		
		// 시작 block num 
		int startBlockNum = (((currentPage - 1) / blockNum) * blockNum) +1;
		
		int lastBlockNum = (((currentPage - 1) / blockNum) * blockNum) + blockNum;
		
		BoardDAO dao = BoardDAO.getInstance();
		totalNum = dao.getBoardCount(); // 전체 게시물 수 저장~!
		
		// 전체 게시물의 수를 한 페이지 당 보여질 게시물의 수로 나누어 주어야 함
		// 이 과정을 거치면 전체 페이지 수가 나오게 됨
		// 전체 페이지 수가 나올 때 나머지가 있으면 무조건 페이지 수를 하나 올려주어야 함		
		totalPage = (int)Math.ceil(totalNum/(double)rowLength);
		
		if(lastBlockNum > totalPage) {
			lastBlockNum = totalPage;
		}
		
		// 현재 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<BoardDTO> pageList = dao.getBoardList(startNum, lastNum);
		
		// 지금까지 페이징 처리 시 작업했던 모든 값들을 view page로 이동시키자
		request.setAttribute("page", currentPage);
		request.setAttribute("rowsize", rowLength);
		request.setAttribute("block", blockNum);
		request.setAttribute("totalRecord", totalNum);
		request.setAttribute("allPage", totalPage);
		request.setAttribute("startNo", startNum);
		request.setAttribute("endNo", lastNum);
		request.setAttribute("startBlock", startBlockNum);
		request.setAttribute("endBlock", lastBlockNum);
		request.setAttribute("List", pageList);
	}

}
