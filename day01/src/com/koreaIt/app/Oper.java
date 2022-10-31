package com.koreaIt.app;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Oper
 */
//@WebServlet("/oper")
public class Oper extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		html 형식 설정
		response.setContentType("text/html; charset=UTF-8");
//		파라미터 이름이 input인 것의 값을 가져온다.
		String input = request.getParameter("input");
		PrintWriter out = response.getWriter();
		String opers = "+-*/";
		String oper = null;
		String[] nums = null;
		Calc calc = null;
		int result = 0;
		String msg = null;
		
		for (int i = 0; i < input.length(); i++) {
			for (int j = 0; j < opers.length(); j++) {
				if(input.charAt(i) == opers.charAt(j)) {
					oper = String.valueOf(input.charAt(i));
				}
			}
		}
		
		nums = input.split("\\" + oper);
		
		try {
			calc = new Calc(nums[0], nums[1]);
			if(nums.length > 2) { throw new NumberFormatException(); }
		
			switch(oper) {
			case "+":
				result = calc.add();
				break;
			case "-":
				result = calc.sub();
				break;
			case "*":
				result = calc.mul();
				break;
			case "/":
				result = calc.div();
				break;
			}
			
			msg = "<h1> 결과 : " + result + "</h1>";
			
		} catch (ArithmeticException e) {
//			0으로 나눔
			msg = "<h1 style='color: red'> 0으로 나눌 수 없습니다. </h1>";
		} catch (ArrayIndexOutOfBoundsException | NumberFormatException e) {
//			잘못 입력
			msg = "<h1 style='color: red'> 잘못된 수식입니다. </h1>";
		}
		
		out.print(msg);
		out.print("<a href='calc'>다시 계산하기</a>");
//		io 객체이므로 close를 반드시 해야한다.
		out.close();
	}
}













