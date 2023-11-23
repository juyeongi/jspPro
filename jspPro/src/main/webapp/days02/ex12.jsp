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
		[리다이렉트/ 포워딩 차이점]
		redirect
			//http://localhost/jspPro/days02/ex09_finish.jsp
		요청 응답시 클라이언트에 갔다옴
		
		forward
			//http://localhost/jspPro/days02/ex12_forward.jsp?name=admin&age=20
		요청 응답시 클라이언트에 전달 x
		
	</xmp>
	<%
	String name = "admin";
	int age = 20;
	%>
	<%-- <a href="ex12_redirect.jsp?name=<%=name%>&age=<%=age%>">리다이렉트</a>
	<a href="ex12_forward.jsp?name=<%=name%>&age=<%=age%>">포워딩</a> --%>
	<a href="ex12_redirect.jsp">리다이렉트</a> <br>
	<a href="ex12_forward.jsp">포워딩</a>
</div>
<script>
	$(function () {
		$("a").on("click", function () {
			$(this).attr("href", function (i, oldhref) {
				return oldhref +"?name=<%=name%>&age=<%=age%>";
			})
		})
	})
</script>
</body>
</html>