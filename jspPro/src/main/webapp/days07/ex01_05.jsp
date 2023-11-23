<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
		[JSTL 함수]
		JSTL 은 EL에서 사용할 수 있는 함수를 제공함
	</xmp>
	<%
		String message = "<h3>Hello World~</h3><br>홍길동<br>";
	%>
	<c:set value="<%= message %>" var="msg"/>
	
	${msg}<br>
	${ fn:length(msg)}<br>
	${ fn:toUpperCase(msg) }<br>
	${ fn:toLowerCase(msg) }<br>
	${ fn:substring(msg, 1, 4) }<br>
	${ fn:contains(msg, "ell") }<br>
	${ fn:trim(msg)}<br>
		:
	fn:replace()
	fn:startWith()
	fn:endWith()
	fn:split()
	fn:join()
	fn:escapeXml()
</div>
<script>

</script>
</body>
</html>