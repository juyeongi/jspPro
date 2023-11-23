<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/inc/include.jspf" %>
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
		[페이지 모듈화]
		  - 하나의 웹애플리케이션을 구성하는 페이지를 상단(Top), 하단(Bottom) 등 
			모든 웹페이지의 공통적인 부분을 모듈화 시켜서
			코드의 중복을 제거, 유지, 보수, 확장에 용이하게 하는 것
		
		모든 웹사이트 : 상단(top), 하단(bottom)
			ㄴ webapp 폴더
				ㄴ top.jsp
				   bottom.jsp
		일정 관리 부분 : 공통 모듈 좌측, 우측
		
		[모듈화 처리]
			1) include 지시자
			2) ' jsp: ' 접두어가 붙은 태그  - 액션태그  // 서버에서 사용
				jsp:include 액션태그
		
		-> [include 지시자 / jsp:include 액션태그 차이점]
			지시자 : 모든 지시자가 하나의 파일로 컴파일되어 하나의 서블릿클래스 생성됨
			액션태그 : 태그만큼 서블릿클래스 생성됨
		
		WEB-INF    ( 외부접근 x )
			inc 폴더
				include.jspf
	</xmp>

</div>
<script>

</script>
</body>
</html>