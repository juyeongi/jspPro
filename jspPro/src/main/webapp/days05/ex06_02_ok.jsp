<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 1. form태그의 입력 값으로 쿠키 생성
	String cookieName=request.getParameter("cookieName");
	String cookieValue=request.getParameter("cookieValue");
	// 쿠키생성시 쿠키 값이 한글인 경우 반드시 인코딩 필요
	Cookie c = new Cookie(cookieName, URLEncoder.encode(cookieValue, "UTF-8") );
	c.setMaxAge(-1);
	//c.setDomain(domain); //localhost
	//c.setPath(uri);   //jspPro/days05 ;
	response.addCookie(c);	//응답객체에 추가
	
	// fontSize 10px   js쿠키생성 + 10일 후 제거
	// JSESSIONID (톰캣에서 자동생성)
	// jsp 처음 요청 > 서버 세션(서버 저장공간) 객체 > 고유 ID값을 클라이언트에게 쿠키로 전달
	
	// 2. 쿠키가 생성된 후 서버에 리다이렉트 > 서버 쿠키 확인
	String location = "ex06.jsp";
	response.sendRedirect(location);
	
%>
