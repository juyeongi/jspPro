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
		jsp 4가지 영역 저장 (서버)
	</xmp>
	
<%
	pageContext.setAttribute("name", "admin");
	request.setAttribute("age", 20);
	session.setAttribute("addr", "서울 역삼동");
	application.setAttribute("tel", "101-");
%>

	>p name : <%=pageContext.getAttribute("name") %><br>
	>r age : <%=request.getAttribute("age") %><br>
	>s addr : <%=session.getAttribute("addr") %><br>
	>a tel : <%=application.getAttribute("tel") %><br>

<br>
	<a href="ex02_03.jsp">ex02_03.jsp</a>

</div>
<script>

</script>
</body>
</html>