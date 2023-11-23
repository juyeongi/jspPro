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
	<a href="/jspPro/days08/list.ss">자료실 목록보기</a>
	<br>
	<xmp class="code">
		게시판 + 파일첨부 > 자료실
		글번호
		제목
	1. 테이블 , 시퀀스 생성
    create table filetest(          
     num number not null primary key  
     , subject varchar2(50) not null     
     
     , filesystemname varchar2(100) -- 실제 저장되는 파일명       a1.txt
     , originalfilename varchar2(100) -- 저장할 때 파일명             a.txt
     , filelength number  -- 파일크기
    );
    
   create sequence seq_filetest;
   
   2. days08패키지
   		ㄴ FileTestDTO
   		ㄴ FileTestDAO
   		ㄴ FileTestServlet
      
      days08 폴더
       ex11_list.jsp
       ex11_write.jsp
       ex11_update.jsp
	</xmp>
	
													<div>
														<span class="input_txt w110" data-skin="form">
															<input type="text" class="text small" title="이메일 아이디 입력" name="email_addr1" id="email_addr1" value="" placeholder="이메일 아이디" data-format="email" autocomplete="off">
														</span>
														<span class="symbol">@</span>
														<span class="input_txt w110">
															<input type="text" class="text small" title="이메일 도메인 입력" name="email_addr2" id="email_addr2" value="" placeholder="이메일 도메인" data-format="email" readonly="readonly" autocomplete="off">
														</span>
														<span class="select w100 hide" data-skin="form">
														<select title="이메일 도메인 선택" name="email_addr_opt" id="email_addr_opt" data-control="emailSelector">	
																<option value="0">직접입력</option>
																<option value="naver.com">네이버</option>
																<option value="hanmail.net">한메일</option>
																<option value="nate.com">네이트</option>
																<option value="gmail.com">지메일</option>
														</select>
														</span><div class="select_wrap w100">	<div class="item_seleced"><a href="#naver.com" title="이메일 도메인 선택 목록 열기" data-title="이메일 도메인 선택">네이버<span class="haze">선택됨</span></a></div>	<div class="item_list_wrap ">		<div class="item_list ui_scrollarea">			<ul class="ui_content"><li><a href="#0"><span>직접입력</span></a></li><li><a href="#naver.com" data-selected="true"><span>네이버</span></a></li><li><a href="#hanmail.net"><span>한메일</span></a></li><li><a href="#nate.com"><span>네이트</span></a></li><li><a href="#gmail.com"><span>지메일</span></a></li></ul>		</div>		<div class="scroll ui_scrollbar">			<span class="bg_top"></span>			<span class="bg bg_mid" style="display: none;"></span>			<span class="bg_btm"></span>		</div>	</div></div>
														<p class="msg_info em hide" id="alert_email_addr">이메일 주소를 다시 확인해주세요.</p>
													</div>
													<p class="msg_desc">이메일 주소 입력 시 사용 가능 특수 문자 : - . _</p>
	
</div>
<script>

</script>
</body>
</html>