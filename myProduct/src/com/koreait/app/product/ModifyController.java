package com.koreait.app.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.app.Execute;
import com.koreait.app.product.dao.ProductDAO;
import com.koreait.app.product.vo.ProductVO;

public class ModifyController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int productNumber = Integer.valueOf(req.getParameter("productNumber"));
		String productName = req.getParameter("productName");
		int productPrice = Integer.valueOf(req.getParameter("productPrice"));
		int productStock = Integer.valueOf(req.getParameter("productStock"));
		System.out.println(productNumber);
		System.out.println(productName);
		System.out.println(productPrice);
		System.out.println(productStock);


		ProductVO productVO = new ProductVO();
		ProductDAO productDAO = new ProductDAO();
		
		productVO.setProductNumber(productNumber);
		productVO.setProductName(productName);
		productVO.setProductPrice(productPrice);
		productVO.setProductStock(productStock);
		
		productDAO.update(productVO);
	}

}
