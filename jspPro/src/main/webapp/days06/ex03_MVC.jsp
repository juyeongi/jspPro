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
	<a href="/jspPro/board/list.do">list.do</a>
	<a href="/jspPro/board/write.do">write.do</a>
	
	<xmp class="code">
		1. days05/ex05_02.jsp 회원가입페이지로 사용
			bmember 테이블 생성
		2. days06/ex01_dafault.jsp 로그인페이지로 사용
		3. header
			로그인, 회원가입
			"홍길동"님 환영, 로그아웃
		4. 글쓰기 로그인 후에 사용 가능 처리 
		5. 게시글 상세보기 수정, 삭제 작성자만 사용 가능 처리 
	</xmp>
	
	<xmp class="code">
		[모델 2구조의 MVC 패턴]
		- 자바 개발자라면 반드시 습득해야할 기본 기법
		- MVC 패턴 이해
		[모델1구조와 모델2구조 이해]
		-jsp 웹 애플리케이션의 구조는 모델 1구조와 모델 2구조로 구성
		  1) 모델 1구조
		  	[lsit.jsp]  >  요청  > list.jsp
		  				  <  응답	<
		  2) 모델 2구조
		    [lsit.jsp]  >  요청  >  1)서블릿 (응답 결과물 생성)
		    				  		>  2)출력담당 list.jsp
		    			  <  응답	<
		   [MVC 패턴]
		   모델 (Model) : 비즈니스 영역 (로직 처리 영역)
		   뷰 (View) : 프리젠테이션 영역 (화면(출력)담당)
		   컨트롤러 (Controller) : 모든 요청과 응답까지를 컨트롤 담당
		   
		   [MVC 패턴 처리과정]
		   A [wirte.html]   > 요청						 핸들러/커맨드 > 서비스 > DAO > DB	
		   B [list.html]     > 요청	-> [컨트롤러(c)]  -> 모델(M) == 처리 결과물
		   C [logon.html]  > 요청 		  : 요청 분석		  : 요청 로직처리
		   									(출력담당 파악 > 뷰)	<	결과물
		   						<	응답	< 
		  
		  [실습]  
		  1. 게시판 : days04.board 폴더
    		ㄴ delete.jsp
  			ㄴ edit.jsp
	  	    ㄴ list.jsp
	      	ㄴ view.jsp
      		ㄴ write.jsp
    
    	 2. days04.board패키지   : 서블릿( List.java, Write.java )
       		days04.board.domain패키지   : VO, DTO
       		days04.board.persistence패키지   : DAO
    
   			[MVC 패턴으로 수정]
		  1) 모든 요청은 컨트롤러 (하나의 서블릿)에서 받음
		  2) list.htm, write.htm, delete.htm 모든 요청 > 하나의 서블릿 처리
		  		url-pattern 지정  :   /  
		  					**		  :  *.확장자
		  3) 컨트롤러(하나의 서블릿) 이름 : DispatcherServlet.java
		  		(1) 모든 요청 > 어떤 모델(핸들러 객체)이 처리하는지 파악(매핑)
		  			 		요청주소    처리모델
		  			  ex) list.do = ListHandler
		  			- 매핑 파일 선언 : commandHandler.properties
		  				ㄴ 처리 모델 목록
		  		(2) 결과물 저장
		  		(3) 리다이렉트 / 포워딩 결정 
		  4) 모델(커맨드핸들러)
		  		인터페이스 CommandHandler
		  		ListHandler impl CommandHandler
		  		WriterHandler impl CommandHandler
		  		:
		  5) DAO,DTO 
		  6) service 패키지
		  7) jsp 페이지			
	</xmp>
</div>
<script>

</script>
</body>
</html>