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
		[스크립트요소]
		1. 스크립트릿
		2. 표현식
		3. 선언문
	</xmp>
	<%
	String name = "홍길동";
	%>
	<%="표현식, 출력" %>
	
	<%!
	int age = 20;
	
	public String printMsg(String msg){
		return "안녕 :" + msg;
		
	}
	
	%>
	이름: <%= name %> <br>
	나이: <%= age %> <br>
	메서드 호출 : <%= printMsg("헬로우") %> <br>
	
	<%
	int sum = 0;	
	%>
	sum 변수 선언 <br>
	<%
	for(int i =1; i<=10; i++){
		%><%=i %>+<%
		sum+= i;
	}
	%>=<%=sum
	%>
</div>
<script>

</script>
</body>
</html>