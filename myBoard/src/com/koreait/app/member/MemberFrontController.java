package com.koreait.app.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.app.Result;

public class MemberFrontController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	
	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String request = requestURI.substring(contextPath.length());
		Result result = null;
		
		if(request.equals("/member/checkIdOk.me")) {
//			화면 이동 없이 Ajax로 진행되기 때문에 result값에 값을 넣을 필요가 없다. -> 넣어도 달라지는 건 없음(김인영이 언젠가 헤어지듯)
			new CheckIdOkController().execute(req, resp);
	    } else if(request.equals("/member/join.me")){
			result = new Result();
			result.setPath("/app/member/join.jsp");
		} else if(request.equals("/member/joinOk.me")) {
//			정보를 가지고 오기 때문에(DB에 대한 연산이 필요하기 때문에) result에 컨트롤러의 execute값을 가져옴
			result = new JoinOkController().execute(req,  resp);
		} else if(request.equals("/member/login.me")) {
//			정보가 필요 없이 단순 페이지 이동
			result = new Result();
			result.setPath("/app/member/login.jsp");
		} else if(request.equals("/member/loginOk.me")) {
	        result = new LoginOkController().execute(req, resp);
	    } else if(request.equals("/member/logout.me")) {
	        result = new LogOutController().execute(req, resp);
	    } 



//		result 값을 가져오지 못했을 경우를 대비(Ajax 요청같이 out.print로 직접 응답한 경우에는 result 값이 없다) 
//		이렇게 안하면 Ajax 요청에서도 result값이 있기 때문에 충돌이 일어날 수 있다.
		if(result !=null) {
//			단순 페이지 이동은 isRediect 값이 false가 들어옴(isRedirect를 받지 못했지만 Default 값이 false니까)
			if(result.isRedirect()) {
				resp.sendRedirect(result.getPath());
			} else {
				RequestDispatcher dispatcher = req.getRequestDispatcher(result.getPath());
//				req, resp 값을 result.getPath()로 보낸다.
				dispatcher.forward(req,  resp);
			}
		}
	}
}
