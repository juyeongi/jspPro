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
		InvalidClientIdMapError에러
		링크 YourKey 수정 
	</xmp>
	<!-- 37.4993024780866, 127.03318968220886 -->
	<a href="ex01_02.jsp?lat=37.499294&lng=127.0331883">(주)쌍용교육센터</a>
	<div id="googleMap" style="width:100%; height:400px;"></div>
</div>

<script>
   function myMap(){
	   
	   
      var mapOptions = {
    		  	//지도 가운데 위치(위도,경도)
      	center: new google.maps.LatLng(51.508742, -0.120850)
        , zoom: 5
                    }; 
      var map = new google.maps.Map( 
      	document.getElementById("googleMap")  
        , mapOptions 

                         );
   }
</script> 
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAhvDYRhKYICQtAL2oqQinEwW2AH5fD50k&callback=myMap"></script>
</body>
</html>