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
		[EL 비교연산자]
		[EL 삼항연산자]  ? :
		[EL 논리연산자]
		
		[EL empty 연산자]
		null 	 			ture
		"" 		 			true
		0 		 			true
		빈 Map 			true
		empty this  	true
		위 조건을 제외한 나머지는 false 반환
	</xmp>
	
	${ 100==10 }<br>
	${ 100 eq 10 }<br>
	
	${ 100 !=10 }<br>
	<%-- ${ 100 ne 10 }<br> --%>
	
	${ 100 > 10 }<br>
	${ 100 gt 10 }<br>
	
	${ 100 < 10 }<br>
	${ 100 lt 10 }<br>
	
	${ 100 >= 10 }<br>
	${ 100 ge 10 }<br>
		
	${ 100 <= 10 }<br>
	${ 100 le 10 }<br>
</div>
<script>

</script>
</body>
</html>