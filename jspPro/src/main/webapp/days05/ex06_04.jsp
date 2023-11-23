<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String [] delCookieNames= request.getParameterValues("ckbCookie");
	for(int i =0; i<delCookieNames.length; i++){
		// js 쿠키삭제 : 똑같은 쿠키이름으로 만료시점을 과거로 해서 쿠키 삭제
		// jsp 쿠키삭제 : 만료시점을 과거로 해서 쿠키 새로 생성
		String cookieName=delCookieNames[i];
		Cookie c = new Cookie(cookieName, "");  // "" or null
		c.setMaxAge(0);	// 응답후 바로 삭제
		response.addCookie(c);
	}//for
	// alert() 쿠키삭제 알림 > 쿠키확인 페이지로 이동 (ex06_03.jsp)
	
%>
<script>
	alert("쿠키삭제 완료~");
	location.href="ex06_03.jsp";
</script>