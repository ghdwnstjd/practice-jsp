package com.koreaIt.app;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MyServlet
 */

public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("userName"));
		String name = request.getParameter("userName");
//		폰트 깨지지 않도록 UTF-8로 설정
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(name);
		out.print("<h1>서블릿으로 만든 페이지</h1>");
//		/를 넣으면 절대경로로 들어간다.
//		/index.jsp >> http://localhost:8085/index.jsp
//		index.jsp >> http://localhost:8085/day01/index.jsp
		out.print("<a href='index.jsp'>JSP로 이동!</a>");
//		PrintWriter는 (파일 입출력 때 배운)io객체이기 때문에 만드시 close를 해주어야 한다.
		out.close(); 
	}
}
