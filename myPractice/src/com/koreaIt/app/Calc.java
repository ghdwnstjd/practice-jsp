package com.koreaIt.app;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Calc
 */
public class Calc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Calc() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String calculation = request.getParameter("calculation");
		String cal = null;
		int result = 0, firstNumber = 0, secondNumber = 0;
		String[] numbers = new String[3];
		char[] operators = {'+', '-', '*', '/'};
		
		for (int i = 0; i < calculation.length(); i++) {
			for (int j = 0; j < operators.length; j++) {
				if(calculation.charAt(i) == operators[j]) {
					cal = String.valueOf(operators[j]);
					numbers = calculation.split("\\" + operators[j]);
					break;
				}
			}
		}
		firstNumber = Integer.parseInt(numbers[0]);
		secondNumber = Integer.parseInt(numbers[1]);
		switch(cal) {
		case "+":
			result = firstNumber + secondNumber;
			break;	
			
		case "-":
			result = firstNumber - secondNumber;
			break;	
			
		case "*":
			result = firstNumber * secondNumber;
			break;	
			
		case "/":
			if(secondNumber==0) {
				result=0;
			}
			else {
				result = firstNumber / secondNumber;				
			}
			break;	
		default:
			
			break;	
		}
		
		System.out.println(result);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<h1>결과값</h1>");
		out.print(result);
		out.print("<br><a href='calc.jsp'>돌아가기</a>");
		out.close();
		
	}

}
