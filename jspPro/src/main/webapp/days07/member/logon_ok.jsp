<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	// days07.AuthInfo.java  인증받은 객체 저장 
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	//  db연동 > 입력받은 id/pwd/authority 확인
	// session.setAttribute("세션", 인증받은 객체 );  
	// 로그인 계정명으로 인증정보 저장 
	session.setAttribute("auth", id);
	
	String location = "/jspPro/days07/ex03.jsp";
	
	 String referer = (String)session.getAttribute("referer");
	if( referer != null){
		location = referer;
		// 이전경로로 이동 후 저장한 session 삭제
		 session.removeAttribute(referer);
	}
	response.sendRedirect(location);
%>