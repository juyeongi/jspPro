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
	jsp days01
</h3>
<div>
	<xmp class="code">
		1. 서블릿(Servlet)
			- 자바 웹기술
		2. 구현방법(과정)
			1) 서블릿 규칙을 따르는 자바 클래스 선언
				 ㄱ. 접근지정자 public
				 ㄴ. javax.servlet.http.HttpServlet 클랙스 상속받아야 함
				 ㄷ. service(), get(), post() 메서드 오버라이딩
			2) 컴파일 > ???.class (클래스파일)								// 이클립스 x
			3) /WEB-INF/classes 폴더 안에 클래스파일 넣어두기			// 이클립스 x
			4) 요청 url 정한 후 url 매핑
				 ㄱ. web.xml 서블릿 등록/ url 매핑
				 ㄴ. 서블릿 3.0 ~ @WebServlet 어노테이션 처리
			5) 브라우저 > 요청 url  > 등록된 서블릿 응답
		3. 실습 예제
			1) [서블릿 규약]을 따르는 자바클래스 선언
					src/main/java > days01 > Now.java 
			2) url 패턴 설정 방법 (암기  //)<url-pattern>/jspPro/days01/Now.html</url-pattern>
				ㄱ.   /  : MVC 패턴 처리
							웹 애플리케이션의 [기본 서블릿]으로 등록/매핑 시 사용
				ㄴ.  *확장자  
				ㄷ.  /경로명/경로명/.../*
				ㄹ.  위 3가지 제외한 나머지 하나> 정확한 url 지정
	</xmp>
	<a href="/jspPro/days01/now.html">Now.html 서블릿 요청</a>
	<br>
	<a href="/jspPro/days01/now">Now 서블릿 요청</a>
	<br>
	<a href="/jspPro/days01/now.ss">Now.ss 서블릿 요청</a>
</div>
<script>

</script>
</body>
</html>