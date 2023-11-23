<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 2) <%@ include file="/WEB-INF/inc/include.jspf" %> --%>
<%--  
	1)
	<%
		request.setCharacterEncoding("UTF-8");
	%> 
--%>
<!-- 3) web.xml  > config속성으로 인코딩 -->
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
		<!-- post방식 인코딩깨짐 utf 인코딩 설정 -->
	<%
		String name = request.getParameter("name");
		String age = request.getParameter("age");
	%>
	전달된 한글 이름 : <%=name %><br>
	전달된 나이 : <%=age %><br>
	<hr>
	전달된 한글 이름 : ${param.name }<br>
	전달된 나이 : ${param.age }<br>
</div>
<script>

</script>
</body>
</html>