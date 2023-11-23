<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="/WEB-INF/errer/viewErrorMessage.jsp " %>
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
		[예외처리]
		1. try catch finally문 사용
		2. WEB-INF > errer > viewErrorMessage.jsp 에러처리 페이지 생성
		<%-- <%@ page isErrorPage="true" %> --%> 페이지 생성자 적용 후 exception 객체 생성
		
		--예외가 발생하면 viewErrorMessage.jsp 에러처리 페이지 이동 > 응답
		<%-- <%@ page errorPage="/WEB-INF/errer/viewErrorMessage.jsp " %> --%>
				ㄴ속성설정
		3. WEB-INF 폴더 안 설정파일 - web.xml  ( 톰캣 실행시 실행되는 파일 )
			1) 응답상태 코드별로 예외 페이지 지정
				ex.01 > a href="ex1000.jsp" 추가
				web.xml 404 > 404.jsp 추가
				
				[응답상태 코드] 
				404 : 요청url을 처리하기 위한 자원이 존재하지 않음
				500 : 서버내부 에러 발생 (자바코딩 에러)
				200 : 요청을 정상적으로 처리
				401 : 접근을 허용하지 않음
				400 : 클라이언트의 요청이 잘못된 구문으로 구성 ( url 구성 잘못됨 )
				403 : PUT .. ( 요청 메서드 방식 ) 요청지원 x
			2) 예외 타입별로 예외페이지 지정
				NullPointerException
				~~Exception
	</xmp>

<%
	String name = null;
	name= request.getParameter("name");
	name= name.toUpperCase();
%>
	name 파라미터값 :  <%=name %><br>

</div>

<script>

</script>
</body>
</html>