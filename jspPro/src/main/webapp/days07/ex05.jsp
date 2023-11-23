<%@page import="java.util.Date"%>
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
		
	</xmp>
	<!--페이지가 전체 리로드되면 요청시간 변경됨  -->
	서버 요청 시간 : <%= new Date().toLocaleString() %>
	<br>
	<input type="button" value="js ajax" onclick="load('ex05_ajax_info.txt');">
	<br>
	<p id="demo"></p>
	
</div>
<script>
	let httprequest ; //XMLHttpRequest객체
	
	// 브라우저 종류/버전에 따라 null값이 될 수 있기 때문에 함수 선언
	// 크로스 브라우징
	function getXMLHttpRequest() {
		if( window.ActiveXObject ){   // IE
            try{
               return new ActiveXObject("Msxml2.XMLHTTP");   // 
            }catch(e){
               try{
                 return new ActiveXObject("Microsoft.XMLHTTP");
               }catch(e){
                  return null;
               }
            }
      }else if( window.XMLHttpRequest ){
             return new XMLHttpRequest();
      }else{
         return null;
      }
	}
	function load( url ) {
		//1. XMLHttpRequest 비동기처리 객체 얻어오기
		httprequest = new XMLHttpRequest();
		//2.
		httprequest.onreadystatechange = callback;
		//3. open() 요청 설정
		httprequest.open("GET", url, true);
		//4. send()
		httprequest.send();
	}
	// 응답받은 결과값 처리
	function callback() {
		if (httprequest.readyState==4) { // 서버 요청 완료
			if(httprequest.status==200){ // 요청+응답 성공
				var rtext = httprequest.responseText;   //응답받은 데이터
				let names = rtext.split(",");
				for (let name of names){
					$("#demo").append(
									$("<li></li>")	.text(name) 
									);
				}
				
			}
			
		}
	}
</script>
</body>
</html>