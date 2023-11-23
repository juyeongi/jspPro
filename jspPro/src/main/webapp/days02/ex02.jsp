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
	jsp days02
</h3>
<div>
	<xmp class="code">
		[서블릿]
		1. 서블릿 규약 클래스
		2. 서블릿 등록 + URL 매핑
			1) web.xml			Now.java
				 ㄴ 유지보수( 수정 )에 편리, 서버 실행 중 수정 가능
			2) @어노테이션 사용
				 ㄴ 편리성, 수정시 새로운 클래스 생성
		
		404오류 > 자원x, url 확인
	</xmp>
	<!-- 
	http://localhost/jspPro/days02/Hello
	<a href="Hello">Hello 서블릿 호출</a>
	 -->
	 <!-- 
	 http://localhost/Hello
	 <a href="/Hello">Hello 서블릿 호출</a>
	  -->
	  <a href="/jspPro/Hello">Hello 서블릿 호출</a>
	  <br>
	  <a href="/jspPro/days02/hello.html">Hello 서블릿 호출</a>
	  <br>
</div>
<script>

</script>
</body>
</html>