<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="/jspPro/resources/cdn-main/example.js"></script>
<style>
	.material-symbols-outlined{
		vertical-align: text-bottom;
	}
</style>
</head>
<body>
<header class="sticky">
	<h1 class="main">
		<a href="#">home</a>
	</h1>
	<ul>
		<li> <a href="#">로그인</a> </li>
		<li> <a href="#">회원가입</a> </li>
	</ul>	
</header>
<h3>
	<span class="material-symbols-outlined">view_list</span>
	jsp days00
</h3>
<div>
	<xmp class="code">
		[세션(session)] - 상태관리
		쿠키 - 클라이언트
		세션 - 서버
		1. 세션(session) 생성 : 처음 요청을 하면 세션객체 생성
			ex) 교육원 상담 + 결제 + 입학
			첫날 : 캐비넷 1개 > 수료날
			요청 > 세션 > 
					<- 응답 JESESSION 쿠키값
		2. session.setAttribute() 
			session.getAttribute()
	</xmp>
	
	<%
		//JSESSIONID == getId()
		String sid = session.getId();
		long l = session.getCreationTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date d = new Date();
		d.setTime(l);
	%>
	세션 ID = <%= sid%> <br>
	세션 생성날짜 = <%= sdf.format(d)%> <br>
	
	<%
		long last = session.getLastAccessedTime();
	d.setTime(last);
	%>
	세션 마지막 접속날짜 = <%= sdf.format(d)%> <br>
</div>
<script>

</script>
</body>
</html>