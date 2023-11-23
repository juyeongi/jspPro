<%@page import="com.util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/inc/session_auth.jspf" %>

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
		
	</xmp>
	<%
		if(logonID == null){  //로그인하지 않은상태
	%>
	<div id="logon">
		<form action="ex01_logon.jsp">
    	아이디 : <input type="text" name="id" value="admin" /><br>
    	비밀번호 : <input type="password" name="passwd" value="1234" /><br>
    	<input type="submit" value="로그인" />
    	<input type="button" value="회원가입" />
    	<span style="color:red;display: none">로그인 실패했습니다.</span> 
  </form>
	</div>		
	<%		
		}else{  // 로그인성공
	%>
	<div id ="logout">
		[ <%= logonID %> ]님 환영합니다<br>
   		<a href="ex01_logout.jsp">로그아웃</a>
	</div>
	<%	
		}
	%>
	<!-- 인증x -->
	<a href="/jspPro/cstvsboard/list.htm">게시판</a>
	<a href="">공지사항</a>
	
		<!-- 인증o -->
	<%
		if( logonID !=null ){
	%>
	<a href="">자료실</a>
	<a href="">일정관리</a>
	<%	
		}
	%>
	<!-- 인증o + 관리자권한 == admin 인증 -->
	<%
		if( logonID !=null && logonID.equals("admin")){
	%>
	<a href="">급여관리</a>
	<a href="">인사관리</a>
	<%	
		}
	%>

</div>
<script>
	if( $(param.logon eq "fail")){
		$("#logon span")
		.fadeIn()
		.fadeOut(3000);
	}
</script>
</body>
</html>