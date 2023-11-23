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
		google Map API

	</xmp>
	<div id="googleMap" style="width:100%; height:400px;"></div>
</div>
<script>
  function getRndNumber(min, max) {
		   return (Math.random() * (max - min) ) + min;
  }

  function myMap() {
	  var lat = 37.499294;
	  var lng = 127.0331883;
	  
	  var mapCenter = new google.maps.LatLng( lat, lng ); 
	  var mapCanvas = document.getElementById("googleMap") ;
	  
	  var mapOptions = {
			  
			  center: mapCenter
	          , zoom: 5
	  };
	  var map = new google.maps.Map( 
			  mapCanvas
			  , mapOptions);
	  
/*
	  // 쌍용교육센터의 위치를 표시 마커(지도의 객체)
	  // - 1. [마커], 폴리라인, 다각형, 원, 직사각형, 정보창 등등
	  var marker = new google.maps.Marker({
		      position: mapCenter
		   //, animation: google.maps.Animation.BOUNCE
		     , icon : "pinkball.png"
		     });
	  marker.setMap(map);
	  
	  // 2. 정보창 표시
	  // var message = "<a href='http://www.sist.co.kr'>(주)쌍용교육센터</a>";
	  var message = "<a href='http://www.sist.co.kr'><img alt='lezhin.com 로고' src='//img-s-msn-com.akamaized.net/tenant/amp/entityid/BBFwET1.img'></a>";
	  var infoWindow = new google.maps.InfoWindow(
		   {
			   content: message
		   }	  
	  );
	  infoWindow.open( map, marker );  
 */
	  var marker = new google.maps.Marker({
	      position: mapCenter
	     });
	  marker.setMap(map);
	  
	  var message = "<a href='http://www.sist.co.kr'><img alt='lezhin.com 로고' src='//img-s-msn-com.akamaized.net/tenant/amp/entityid/BBFwET1.img'></a>";
	  var infoWindow = new google.maps.InfoWindow(
		   {
			   content: message
		   }	  
	  );
	  
	  
	  //마커 클릭할 때 정보창 표시
	  google.maps.event.addListener(marker, "click", function () {
		 // alert("x");
		  map.setZoom(15);
		  map.setCenter(marker.getPosition () );
		  infoWindow.open( map, marker );  
		  
		  //3초 후 정보창 닫기
		  window.setTimeout(function(){
			  infoWindow.close();
		  }, 3000);
	  });
  }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAhvDYRhKYICQtAL2oqQinEwW2AH5fD50k&callback=myMap"></script>
</body>
</html>