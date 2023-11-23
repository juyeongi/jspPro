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
	
	<button type ="button" onclick="loadXml();">Get my CD</button>
	<br>
	<br>
	<table id="tbl"></table>
	
</div>
<script>
//브라우저 종류/버전에 따라 null값이 될 수 있기 때문에 함수 선언
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
	function loadXml() {
		//1. xhr = XMLHttpRequest 객체
		let xhr = getXMLHttpRequest();
		//2. xhr.on[readystatechange] = callback 이벤트발생
		xhr.onreadystatechange = function () {
			if (this.readyState == 4 && this.status ==200){
				var xmlDoc = this.responseXML;
				//alert(xmlDoc);
				let cdList = xmlDoc.getElementsByTagName("CD");
				//alert(cdList.length);
				let title, artist;
				
				let tblContent= "<tr><th>TITLE</th><th>TITLE</th></tr>";
				
				for (var i = 0; i < cdList.length; i++) {
					title= cdList[i].getElementsByTagName("TITLE")[0].childNodes[0].nodeValue;
					artist= cdList[i].getElementsByTagName("ARTIST")[0].childNodes[0].nodeValue;
				//	console.log( title +"/" artist);
					tblContent+= `<tr><td>\${title}</td><td>\${artist}</td></tr>`;
				}
				document.getElementById("tbl").innerHTML=tblContent;
			}
		}
		//3. xhr.open() 설정 
		xhr.open("GET", "ex01_cd_catalog.xml", true);
		//4. xhr.send() 명령
		xhr.send(); 
	}
</script>
</body>
</html>