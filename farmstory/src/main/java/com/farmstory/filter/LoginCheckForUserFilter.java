package com.farmstory.filter;

import java.io.IOException;

import com.farmstroy.DTO.member.MemberDTO;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/member/login.do","/member/terms.do","/member/register.do",})
public class LoginCheckForUserFilter implements Filter{

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2) throws IOException, ServletException {
		
		
		// 로그인 여부 확인
		HttpServletRequest req = (HttpServletRequest) arg0;
		HttpSession session = req.getSession();
		
		MemberDTO sessUser = (MemberDTO) session.getAttribute("sessUser");
		
		if(sessUser != null) {
			//로그인 상태이면 리스트로 이동
			HttpServletResponse resp = (HttpServletResponse) arg1;
			resp.sendRedirect("/farmstory/article/index.do");
		}else {
			//로그인 상태이면 다음 필터로 이동 (Controller 요청)
			arg2.doFilter(arg0, arg1);
		}
		
	}

}