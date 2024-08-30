package com.farmstroy.controller.market;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.farmstroy.DTO.product.ProductListDTO;
import com.farmstroy.Service.ProductService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/market/list.do")
public class ListController extends HttpServlet{


	private static final long serialVersionUID = 3798812811405024593L;
	
	private ProductService service = ProductService.INSTANCE;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<ProductListDTO> products;
		List<String> types;
		int count = 0;
		String type = req.getParameter("type");
		if(type==null) {
			products = service.selectMarketProductListTest();
		} else {
			products = service.selectMarketProductList(type);
		}
		
		types = service.SELECT_MARKETPRODUCTS_TYPE();
		int countAll = service.SELECT_MARKETPRODUCTS_COUNT();
		int countFruit = service.select_marketproducts_count_by_type("과일");
		int countVege = service.select_marketproducts_count_by_type("야채");
		req.setAttribute("products", products);
		req.setAttribute("countAll", countAll);
		req.setAttribute("types", types);
		req.setAttribute("countFruit", countFruit);
		req.setAttribute("countVege", countVege);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/market/list.jsp");
		dispatcher.forward(req, resp);
	}
	
	
	
}