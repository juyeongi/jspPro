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
		[표현언어 (ExpressionLanguage == EL 3.0)]
		1. 다른 형태의 스크립트언어
		2. 스크립트 요소 중에 하나
		3. 표현식보다 간결, 편리
		4. jsp 2.0 부터 EL 포함
		5. EL 기능
		  1) jsp 4가지 기본 영역
		  									  EL 내장 객체
		  		- page scope 			> pageContext
		  		- request scope 		> requestScope
		  		- session scope 		> sessionScope
		  		- application scope 	> applicationScope
		  2) EL 연산자
		  	 ==, eq, !=, ne, not, !, empty
		  3) 자바클래스의 메서드 호출 가능 ***
		  4) 람다식 사용
		  5) 쿠키 , jsp 기본 내장 객체
		  6) 스트림 API, 정적 메서드 실행
		 6. EL형식
		  	<%-- ${ 표혀식 } --%>
		 7. jsp 기본 내장객체 9가지 
		 	EL 기본 내장객체  
		 	1) param  ==request.getParameters()
		 			list.jsp?age=10   ==${param.age }
		 			${paramValues}
		 	2) pageContext == page객체
		 	3) scope 객체 : page, requerst, sesssion, application
		 	4) header == request.getHeader()
		 		headerValues == request.getHeaders()
		 	5) coockie
		 	6) initParam == application.getInitParameter()
		 	
	</xmp>
</div>
<script>

</script>
</body>
</html>