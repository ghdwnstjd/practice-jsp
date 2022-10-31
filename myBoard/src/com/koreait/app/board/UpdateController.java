package com.koreait.app.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.app.Execute;
import com.koreait.app.Result;
import com.koreait.app.board.dao.BoardDAO;

public class UpdateController implements Execute {
// 프론트 컨트롤러에서 수정 버튼 클릭 시 넘어오는 공간이다.
//	컨트롤러는 매퍼에서 지정한 DB 명령어를 수행해야 하므로, DAO 생성자를 만들어준다.
//	또한, 게시글 번호를 param값으로 가져와야 하므로 boardNumber를 가져온다.
   @Override
   public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      Result result = new Result();
      BoardDAO boardDAO = new BoardDAO();
      int boardNumber = Integer.valueOf(req.getParameter("boardNumber"));
      
//      boardDAO.select(boardNumber)를 board로 선언하고, update.jsp에 boardNumber가 일치하는 boardDTO 값을 넘겨주어 수정화면이 나오도록 한다.
      req.setAttribute("board", boardDAO.select(boardNumber));
//      update.jsp로 화면을 이동한다.
      result.setPath("/app/board/update.jsp");
      return result;
   }

}