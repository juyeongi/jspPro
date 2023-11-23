<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		[MVC 패턴으로 프로젝트]
		1. 포워딩 이해
		2. 로직처리 xxx.jsp > 서블릿
		
		URL매핑 -/jspPro/scott/dept
		서블릿클래스 - days02.ScottDept.java
			(** <a></a>   get방식    > doGet() 구현)
						(로직처리 + 포워딩)
		포워딩페이지 - ex13_dept.jsp
		
		
	</xmp>
	<a href="/jspPro/scott/dept">부서정보 조회</a>
	<br>
</div>
<script>

</script>
</body>
</html>