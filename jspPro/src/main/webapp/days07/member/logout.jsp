<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	// () 값만 삭제
	//session.removeAttribute("auth");
	// 세션 캐비넷 삭제
	session.invalidate();
	String location = "/jspPro/days07/ex03.jsp";
	response.sendRedirect(location);
%>