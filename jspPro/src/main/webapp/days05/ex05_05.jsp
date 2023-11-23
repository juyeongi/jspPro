<%@page import="java.util.Date"%>
<%@page import="days05.MemberInfo"%>
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
		[ex05_03.jsp]
		ex05_02.jsp 입력한 MemberInfo > MemberInfo.java
		객체생성> jsp:useBean 액션태그 사용 
	</xmp>
	
	<!-- MemberInfo mi = new MemberInfo(); -->
	<jsp:useBean id="mi" class="days05.MemberInfo" scope="page"></jsp:useBean>
	
	<!-- java 클래스 필드명 == input태그 name값이 같아야 * 로 불러오기 가능 -->
	<jsp:setProperty property="*" name="mi"/>
	<jsp:setProperty property="registerDate" value="<%= new Date() %>" name="mi" />
	
	아이디 : <jsp:getProperty property="id" name="mi"/><br>
	이름 : <jsp:getProperty property="name" name="mi"/><br>
	비밀번호 : <jsp:getProperty property="passwd" name="mi"/><br>
	등록일 : <jsp:getProperty property="registerDate" name="mi"/><br>
	이메일 : <jsp:getProperty property="email" name="mi"/><br>
</div>
<script>

</script>
</body>
</html>