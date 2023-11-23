<%@page import="days06.FormatUtil"%>
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
		FormatUtil
			ㄴ String number()
			ㄴ String staticNumber()
	</xmp>
	<%
		long price = 22345;
		request.setAttribute("price", price);
	%>
	price(EL) : ${price };
	<%
		FormatUtil fu = new FormatUtil();
		request.setAttribute("fu", fu);
	%>
	
	price(EL) : ${fu.number(price, "#,##0")};
	
	<hr>

	price(EL) : ${FormatUtil.staticNumber(price, "#,##0")};
	
</div>
<script>

</script>
</body>
</html>