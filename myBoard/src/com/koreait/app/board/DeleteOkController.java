package com.koreait.app.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.app.Execute;
import com.koreait.app.Result;
import com.koreait.app.board.dao.BoardDAO;

public class DeleteOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardDAO boardDAO = new BoardDAO();
		Result result = new Result();
		int boardNumber = Integer.valueOf(req.getParameter("boardNumber"));
		boardDAO.delete(boardNumber);
		
		result.setRedirect(true);
		result.setPath(req.getContextPath() + "/board/listOk.bo");
		return result;
	}

}
