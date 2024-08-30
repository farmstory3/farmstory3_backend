package com.farmstroy.controller.market;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import com.farmstroy.DTO.cart.CartDTO;
import com.farmstroy.DTO.member.MemberDTO;
import com.farmstroy.Service.CartService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/market/deletecart.do")
public class CartDeleteController extends HttpServlet{
	CartService cartService = CartService.INSTANCE;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] selectedCartIds = req.getParameterValues("check");
	    
	    if (selectedCartIds != null) {
	        // String 배열을 Integer 리스트로 변환
	        List<Integer> cartIdsList = Arrays.stream(selectedCartIds)
	                                          .map(Integer::parseInt)
	                                          .collect(Collectors.toList());
	        
	        
	        // 선택된 cart_idx들을 이용해 삭제 작업을 수행
	        cartService.deleteItems(cartIdsList);
	        resp.sendRedirect("/farmstory/market/cart.do");
	    }
	    
	}
}