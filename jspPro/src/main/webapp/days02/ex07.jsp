<%@page import="java.util.Enumeration"%>
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
		[요청 헤더 정보의 처리]
		request 객체
			< 메서드 >
			getHeader(name)   : 지정한 이름의 헤더값 반환
			getHeaders(name) : 지정한 이름의 헤더목록 반환 
													리턴값 Enumeration
		    getHeaderNames()  : 헤더 이름 반환 ( 열거형 )
		    										리턴값 Enumeration
		    getIntHeader(name) : 지정한 이름의 헤더 정수값 반환
		    getDateHeader(name)  : 지정한 이름의 헤더 시간값 반환
		    
		[헤더 정보 설정]
			: 추가
		addHeader(name, value)
		addIntHeader(name, value)
		addDateHeader(name, value)
			: 설정
		setHeader()
		setIntHeader()
		setDateHeader() 
	</xmp>
	<h3>요청 헤더 목록 조회</h3>
	<ol>
		<%
			Enumeration<String> en = request.getHeaderNames();
		while(en.hasMoreElements()){
			String hname = en.nextElement();
			String hvalue = request.getHeader(hname);
		%>
		<li><%=hname %>:<%=hvalue %> </li>
		<%
		}
		%>
	</ol>
</div>
<script>

</script>
</body>
</html>