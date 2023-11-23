<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		form태그 mothod="get"
			> request객체로 파일명이 파라미터 정보로 얻어와짐 
		form태그 method="post" enctype="multipart/form-data"
			> request객체로 파라미터 정보 얻어올 수 없음
		
	</xmp>
	
	<form action="ex08_ok_02.jsp" method="post" enctype="multipart/form-data">
	<!-- <form action="ex08_ok.jsp"> -->
	이름 : <input type="text" name ="name" value="홍길동"><br>
	첨부파일 : <input type="file" name="upload">
	<input type="submit">
	</form>
	
</div>
<script>

</script>
</body>
</html>