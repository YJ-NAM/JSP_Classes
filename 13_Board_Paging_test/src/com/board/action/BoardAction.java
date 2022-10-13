package com.board.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface BoardAction {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException;

}
