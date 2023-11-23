<%@page import="com.util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/inc/auth.jspf" %>
<%-- 
<%
	//쿠키사용해서 로그인(인증)처리
	//로그인성공(인증처리)하면 auth 쿠키이름으로 로그인한 아이디를 쿠키값으로 저장
	String cname = "auth"; // cookie name
	String logonID = null ; // cookie value

	Cookies cookies = new Cookies(request);
	if( cookies.exists(cname) ){ // 쿠키 유무
		logonID = cookies.getValue(cname);	
	}
%> 
--%>
<%
	//로그아웃시 쿠키삭제
												//쿠키값 "" , 만기시점 0(바로삭제)
	Cookie c = Cookies.createCookie("auth", "", "/", 0); 
	response.addCookie(c);
%>
<script>
	alert( "<%=logonID%>님이 로그아웃하셨습니다.");
	location.href ="ex07_default.jsp"
</script>