<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		1. MVC 패턴
		2. 세션 - 인증처리, 권한처리, 장바구니
		3. 페이징 모듈화
		4. [필터 ( Filter )]
			1) http 요청 - 자원 접근권한
							  파라미터 유무
							  사전에 체크 가능
							  요청 취소
					   응답 - xml(요청)  -> JSON(응답) 자동 변환
					   		  자동으로 암호화처리 후 응답
			2) 처리과정
			[클라이언트] -> list.do -> [서버]처리
						  <- 	응답	<-
								// url 패턴으로 필터조건 지정
								// 필터 체이닝기능 ( 필터 연결 )
			[클라이언트] -> list.do -> 필터1 -> 필터2 -> 필터3 -> [서버]처리
						  <- 	응답	 <- 1 xml> JSON 변환, 2 암호화처리 ..
			3) 필터 구현시 핵심 타입 3가지
				(1) javax.servlet.Filter 이터페이스 구현
					- init() 필터 초기화 메서드 오버라이딩
					- destory()
					- ***doFilter() *** : 필터링할 작업. 코딩
							암호화, 인증, 권한체크 ...
						 > 다음 이동(체이닝)  : chain.doFilter()
				(2) ServletRequestWrapper 	: 요청을 포장(변경)한 결과 저장 객체
				(3) ServletResponseWrapper : 응답을 포장(변경)한 결과 저장 객체
			4) 필터클래스를 사용하려면 
				lib폴더 > servlet-api.jar 파일 추가
				이클립스로 개발할 경우 추가x
			5) 필터클래스 선언 
				필터클래스 > web.xml 에 등록 (서블릿처럼 사용 가능)
							   @WebFilter 어노테이션
	</xmp>
</div>
<script>

</script>
</body>
</html>