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
		1. [ajax] 에이작스, 아작스
		[A]synchronous [J]avascript [A]nd [X]ML
		  - XML 데이터를 비동기적인 자바스크립트언어를 사용해서 비동기적으로 처리하는 기술
		2. 비동기적이란
		  - 페이지가 로드된 후에도 웹서버에서 데이터를 읽어와서 사용 가능
		  - 페이지가 전체 새로고침되지 않고 웹페이지의 일부분만 업데이트 가능
		  - 현재 페이지는 유지된 채로 ㅁ백그라운드에서 웹서버와 통신하는 것
		3. 네이버 메인페이지에서 환율, 증시, 날씨정보 ..
		  - 회원가입
		  	ㄴ 아이디 중복체크버튼 : 현재페이지를 유지한 채 중복체크
		4. ajax 장점
		  - 전체페이지를 리로드하지 않아 성능향상, 개발향상, 각각의 서버로부터 분산처리 가능
		5. ajax 단점
		  - js 보안 취약
		  - 차별화 x
		  - 브라우저 호환성 체크
		6. js ajax 처리과정
			1) 웹페이지에서 이벤트 발생
			2) XMLHttpRequest 객체 생성 
				ㄴ 비동기적으로 서버 이동하는 비동기적 객체
			3) XMLHttpRequest 객체 설정
				ㄱ. 요청 설정
				  - open() 메서드 : 요청시 필요한 설정
				  - send() 메서드 : 실제 서버에 요청
				ㄴ. XMLHttpRequest 객체.onreadystatechange 이벤트 속성
					 ㄴ 객체의 상테 체크 ( 상태가 바뀔 때 이벤트 발생 )
				=function(){     //callback함수 항상 호출됨
					if(state = 200, readyState = 4){   //서버 작업처리 여부
						// 요청+작업성공       //요청완료
						//응답데이터
						1) 텍스트 : responseText 속성
						2) xml : responseXML
					}
				}
			4) get방식 ajax 요청
				XMLHttpRequest.open("GET", "/test.jsp?id=admin", true)  // 비동기적으로 이동할 위치값
				XMLHttpRequest.send();
				
			5)	post방식 ajax 요청
				XMLHttpRequest.open("POST", "/test.jsp", true);   // true 고정값
				XMLHttpRequest.send("id=admin");	// 파라미터값이 send()에 위치
				
		7. jquery ajax ***
		
		ex05.jsp       javascript
		ex05_02.jsp  jquery
		ex05_ajax_info.txt  값저장
	</xmp>
</div>
<script>

</script>
</body>
</html>