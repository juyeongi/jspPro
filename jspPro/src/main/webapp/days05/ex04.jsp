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
		[jsp 기본 내장 객체 9가지 + 영역 (scope)]
		1. request : HttpServletRequest (요청객체)
		2. resopnse : HttpServletResponse (응답객체)
		3. outp : JspWriter (출력담당 string 객체)
		4. exception : Trowable (예외객체)
		
		5. session : HttpSession
		6. application : ServerContext
						웹 애플리케이션에 대한 정보 저장 객체
		7. pageContext : PageContext타입, JSP 페이지에 대한 정보를 저장하고 있는 객체 (저장공간)
		8. page : Object타입, JSP 페이지를 구현한 자바 클래스 인스턴스 (서블릿 객체)
		9. config : ServletConfig타입, 설정 정보를 저장하는 객체
		
	</xmp>
</div>
<script>

</script>
</body>
</html>