<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	String location;
	if( id.equals("admin") && passwd.equals("1234") ){
		//로그인 성공
		String name = "관리자";
		// ** 리다이렉트 할 때 한글 파라미터값이 포함된 경우
		// 반드시 인코딩을 해야함
		location = "ex11.jsp?ok&name=" + URLEncoder.encode(name, "UTF-8");	
	}else{ // 로그인 실패
		location= "ex11.jsp?error";
	}
	// 다시 돌려보내기
	response.sendRedirect(location);
%>