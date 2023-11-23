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
		pageContext 저장객체 == page Scope (저장영역)
	</xmp>
	<%
//		pageContext.getAttribute(name);
//		pageContext.setAttribute(name, value);
			
			//pageContext로 기본 저장 객체를 얻어올 수 있음
			//사용자 정의 태그(커스텀태그)를 구현할 때 사용
//		pageContext.getRequest()  == jsp 기본객체 request
//		pageContext.getResponse() == jsp 기본객체 response
//		pageContext.getOut() == jsp 기본객체 out
//		pageContext.getServletConfig() == jsp 기본객체 config
//		pageContext.getServletContext() == jsp 기본객체 application	
		
	%>
	
</div>
<script>

</script>
</body>
</html>