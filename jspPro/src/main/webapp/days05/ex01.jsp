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
		[예외처리방법]
		1. try catch finally문 사용
		2. 예외처리하는 페이지 생성
		- WEB-INF > errer > viewErrorMessage.jsp 에러처리 페이지 생성
		<%-- <%@ page isErrorPage="true" %> --%> 페이지 생성자 적용 후 exception 객체 생성
		3. 예외처리 우선순위
			1) page 지시자의 errorPage 속성으로 지정한 에러페이지 처리
			2) 예외 타입별 처리 - web.xml
			3) 예외 코드별 처리 - web.xml
			
			4) 웹 컨테이너가 제공하는 기본 에러페이지 
	</xmp>

<%
	String name = null;
	
	try{
		name= request.getParameter("name");
		name= name.toUpperCase();
	}catch(NullPointerException e){
		name= "익명";
	}catch(Exception e){
		
	}
%>
	name 파라미터값 :  <%=name %><br>
	
	<a href="ex1000.jsp">ex1000</a>

</div>

<script>

</script>
</body>
</html>