package com.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*@WebFilter("/LoginCheckFilter")*/
/*
public class LoginCheckFilter implements Filter {

    public LoginCheckFilter() {

    }

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println(">LoginCheckFilter.doFilter() ...");
		// 세션 auth 인증 + 권한 저장
		// request로 세션 불러올 때 : HttpServletRequest 
		// doFilter의 request : ServletRequest
		// 다운캐스팅 필요
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res =  (HttpServletResponse) response;
		
		String auth = null;
		boolean isLogon = false;   //인증 t/f
		
		HttpSession session = req.getSession(false);
		
		if (session != null && ( auth = (String) session.getAttribute("auth")) !=null ) {
			//인증처리 o
			isLogon = true;
		}
		//인증 여부에 따라 인증x(lognon x) 페이지 전환 
		if (isLogon) {
			chain.doFilter(request, response);
		} else {
			// 이전 요청경로 세션에 저장

			 String referer = req.getRequestURI(); 
			 session.setAttribute("referer", referer);
			
			String location = "/jspPro/days07/member/logon.jsp";
			res.sendRedirect(location);
		}//if
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
*/
