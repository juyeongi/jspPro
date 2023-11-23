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
		[js 쿠키] document.cookie 속성 ( 쿠키 생성, 확인, 삭제, 수정 )
		*[jsp 쿠키(cookie)]*
		
		쿠키 : 클라이언트에 텍스트형식으로 저장된 텍스트파일 ( 서버에 저장 x )
			- 클   >  요청  >  서버
					쿠키 함께 서버에 전송
			- 상태관리
			
			[jsp 쿠키 생성+ 처리과정 이해]
			1) [클]  >  요청(쿠키)  >  [서버]
											jsp코딩 
					  <  응답
				[클]
				쿠키 저장
				[클] > 새로운 요청(쿠키)  >  [서버]
											 쿠키삭제
					  <  응답
				[클]
				쿠키 삭제
			- jsp 쿠키
			1) cookie클래스 > 쿠키 생성
			2) 응답 (클라이언트)
				response.addCookie(생성된쿠키)
			- 쿠키 구성
			1) "쿠키이름=쿠키값;_만료시점=x;_도매인=localhost;_경로=/;_보안"
				만료시점=[-1]  브라우저 닫을 때 자동 쿠키 제거  (defalt)
				만료시점= 0  응답받은 후 바로 쿠키 제거
					**별도의 만료시점을 설정하지 않으면 브라우저가 종료될 때 쿠키 제거
	</xmp>
	<a href="ex06_02.jsp">ex06_02.jsp 쿠키 생성</a>
	<a href="ex06_03.jsp">ex06_03.jsp 쿠키 확인</a>
</div>
<script>

</script>
</body>
</html>