<%@page import="java.util.Enumeration"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
/* 
http://localhost/jspPro/days05/ex06_05_ok.jsp
?
name=%ED%99%8D%EA%B8%B8%EB%8F%99
&
age=20 
*/
//쿠키생성
	Enumeration<String> en= request.getParameterNames();
	while(en.hasMoreElements()){
		String cookieName = en.nextElement();  //얻어온 쿠키이름
		String cookieValue =request.getParameter(cookieName);

	Cookie c = new Cookie(cookieName, URLEncoder.encode(cookieValue, "UTF-8") );
	c.setMaxAge(-1);
	response.addCookie(c);
	}
%>
<script>
	alert("쿠키수정 완료~");
	location.href="ex06_03.jsp";
</script>
