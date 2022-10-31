package com.koreait.app.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.koreait.app.Execute;
import com.koreait.app.product.dao.ProductDAO;
import com.koreait.app.product.vo.ProductVO;

public class ListController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		
		ProductDAO productDAO = new ProductDAO();
		
		PrintWriter out = resp.getWriter();
		JSONArray lists = new JSONArray();
		productDAO.selectAll().forEach(
				product -> {
					JSONObject products = new JSONObject(product); 
					lists.put(products);
				});
	
////		다른 방법
//		for(ProductVO productVO : productDAO.selectAll()) {
//			JSONObject product = new JSONObject(productVO);
//			lists.put(product);
//		}
		
		out.print(lists);
		out.close();
	}
}
