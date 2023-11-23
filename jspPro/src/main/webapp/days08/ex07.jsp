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
		[파일 업로드]
		1. 업로드 		: 클라이언트 > 서버
					- 회원가입 : 가입자 사진등록
					- 쇼핑몰 : 상품 사진 복수 등록
					- 자료실 : 게시글 작성 + 첨부파일 
			다운로드 	: 서버 > 클라이언트
		
		2. ***실제 파일 업로드 
			1) 스트링 기반 전송방식인 method="post" 설정 
			2) 인코딩 설정 수정 : enctype="multipart/form-data"	
				(기본 : enctype="application/x-www-form-urlencoded")
		3. 실습
			1) 업로드 폴더추가 (서버에 저장될 위치)
			2) ex08.jsp
				ex08_ok.jsp
		4. 파일 업로드 방법
			1) 개발자가 직접 구현 request.getInputStream()  XXXX
			2) 외부에서 제공하는 라이브러리 사용
				ㄱ. http://www.servlets.com/cos/
				ㄴ. COS-22.05.zip 다운로드
					 	WEB-INF > lib 폴더에 cos.jar 저장
				ㄷ. request 객체 파라미터값 null
					cos.jar 파일에서 제공하는 [MultipartRequest] 클래스 사용
							: 객체 생성해서 파라미터값, 첨부파일 처리
		
		MultipartRequest mrequest = new MultipartRequest ( ㄱ, ㄴ, ㄷ, ㄹ, ㅁ);
			ㄱ. request객체
			ㄴ. 서버에 저장될 위치(경로)
			ㄷ. 최대 파일 크기
			ㄹ. 파일 인코딩 방식
			ㅁ. 파일 중복처리위한 인자(클래스 제공)
		[실습] - ex09.jsp / ex09_ok.jsp
			3) 서블릿 3.0 / 3.1 에서 재공하는 라이브러리 
				(1) HttpServletReqeust request 의 [getPart()]를 이용해서 업로드된 데이터(파일) 접근할 수 있는 [Part 객체]
                        .getName() : 파라미터 이름
                        .getContentType() : Content Type 
                        .getSize() : 업로드한 파일 크기
                        .getSubmittedFileName() : 업로드한 파일명 
                        .getInputStream()  
                        .write() : Part의 업로드 데이터를 파일명이 지정한 파일에 복사.
                        .delete() : 생성된 임시 파일을 삭제.
                        .getHeader() : 해당 Part에서 지정한 이름의 헤더 값을 얻어온다.
                        
                 (2) 서블릿이 [multipart 데이터]를 처리할 수 있도록
                      -  web.xml 설정
                      - @MultipartConfig 어노테이션을 사용해서 설정
                      예) web.xml 복사 + 붙이기 -> web_days11_replyboard.xml
                            ex03.jsp 복사 + 붙이기 -> ex04.jsp
                            jspPro/days12/upload ->  UploadServlet.java 서블릿 추가
                       
                       에러 : java.lang.IllegalStateException: 어떤 [multi-part 설정]도 제공되지 않았기 때문에, part들을 처리할 수 없습니다.
	</xmp>
	
</div>
<script>

</script>
</body>
</html>