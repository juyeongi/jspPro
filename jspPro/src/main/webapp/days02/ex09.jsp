<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String error = request.getParameter("error");
 	// ? 				null
 	// ?error 		""
 %>
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
		[로그인 페이지]
			ex09_ok.jsp  화면출력 x ,id/passwd 확인 
			script - 브라우저에서 처리 	// 서버에서는 alert창 띄울 수 없음
	</xmp>
	<form action="ex09_ok.jsp" method="get">
		아이디: <input type="text" name = "id" value ="admin"> <br>
		비밀번호: <input type="password" name="passwd" value="1234"> <br>
		<input type="submit" value="logon">
	</form>
<%
	if( error !=null && error.equals("") ){
%>
<script>
	alert("로그인 실패");
</script>
<%
	}
%>
</div>

<script>
<%-- 	//  ?error   false
	//	null  		false
	alert( new Boolean( <%= error%> ) ); --%>
</script>
</body>
</html>