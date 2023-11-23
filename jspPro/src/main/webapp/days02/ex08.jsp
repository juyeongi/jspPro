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
		[JSP 기본 내장 객체 (9가지)]
		1. request (요청)
		2. response (응답) - 웹브라우저(클라이언트)에 보내는 응답정보를 담는 객체
			1) 헤드정보 입력
			2) 리다이렉트(redirect) / 포워딩
				-페이지 이동기능
				
				ㄱ. 리다이렉트 
				  사전적 의미: 다른 방향으로 다시 전송하다(보내다)
				ex) 클라이언트[a.jsp] ->  서버 a.jsp 요청
						        		   <-
								[a.jsp]-> b.jsp 요청
						        			<-
					: 요청값 거부당하면 다시 클라이언트에가서 다른값으로 재요청
				ㄴ. 포워드
				 클라이언트[a.jsp] -> a.jsp 요청
				 					  <- b.jsp 요청
				 	: 클라이언트를 거치지 않고 서버에서 재요청 
				ex09.jsp    > ex09_ok.jsp  >  ex09_main.jsp
				아이디				 인증
				비밀번호			DB id/pwd
				[로그인] 			 인증실패	     > ex09.jsp?error (or 다시 로그인창으로 이동)
	</xmp>
	<a href="ex10.jsp">ex10.jsp</a>
	<a href="ex10.jsp?error">ex10.jsp?error</a>
	<a href="ex10.jsp?error=1001">ex10.jsp?error=1001</a>
</div>
<script>

</script>
</body>
</html>