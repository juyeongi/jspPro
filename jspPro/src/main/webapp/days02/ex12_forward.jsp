<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = "ex12_finish.jsp";
	//Dispatcher 발송담당자, 운전 지시장치
	// 요청 발송 담당자 생성
	RequestDispatcher dispatcher = request.getRequestDispatcher(path);
	dispatcher.forward(request, response);
%>