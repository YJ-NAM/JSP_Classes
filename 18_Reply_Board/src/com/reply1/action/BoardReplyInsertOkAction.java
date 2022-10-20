package com.reply1.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reply1.controller.Action;
import com.reply1.controller.ActionForward;
import com.reply1.model.BoardDAO;
import com.reply1.model.ReplyDTO;

public class BoardReplyInsertOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 답변글로 넘어온 데이터 DB 저장
		
		String reply_writer = request.getParameter("writer").trim();
		String reply_content = request.getParameter("content").trim();
		int reply_bno = Integer.parseInt(request.getParameter("bno"));
		
		ReplyDTO dto = new ReplyDTO();
		dto.setBno(reply_bno);
		dto.setRewriter(reply_writer);
		dto.setRecont(reply_content);
		
		BoardDAO dao = BoardDAO.getInstance();
		int check = dao.replyInsert(dto);
		PrintWriter out = response.getWriter();
		
		// 결과값을 클라이언트(ajax // 호출한 쪽)에 보내줌
		out.println(check);
		
		return null;
	}

}
