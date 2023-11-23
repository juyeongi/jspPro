<%@page import="com.util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	String location = "ex01_default.jsp";
	if(id.equals("admin") && passwd.equals("1234")){
		//관리자 로그인성공
		// auth 쿠키이름 로그인ID 저장
		session.setAttribute("auth", id);
		response.sendRedirect(location);

	}else if(id.equals("hong") && passwd.equals("1234")) {
		session.setAttribute("auth", id);
		response.sendRedirect(location);
		
	}else if(id.equals("park") && passwd.equals("1234")) {
		session.setAttribute("auth", id);
		response.sendRedirect(location);
	}else{
		//로그인 실패
		 location = "ex01_default.jsp?logon=fail";
		 response.sendRedirect(location);
	}
%>
