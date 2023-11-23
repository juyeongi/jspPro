<%@page import="java.util.Date"%>
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
		
	</xmp>
	<h3><%= new Date().toLocaleString() %></h3>
	<input type="button" id="btn1" value="jquery ajax + json">
	<br>
	<p id="demo"></p>
</div>
<script>
	$(function () {
		$("#btn1").on("click", function () {
			$.ajax({
				/* url: "ex05_empjson.jsp" */
				//json라이브러리 사용해서 응답데이터 생성
				url: "ex05_empjson_lib.jsp"
				, dataType: "json"
				, type:"GET"
				, data: null
				, cache: false
										//응답데이터
				, success: function (data, textStatus, jqXHR) {
					//alert(data.emp); // js array 
					$(data.emp).each(function(i, element) {
						$("#demo").append(`<li>\${element.empno} : \${element.ename}</li>`);
					});
				}
				, error: function () {
					alert("error");
				}
			});
		});
	});
</script>
</body>
</html>