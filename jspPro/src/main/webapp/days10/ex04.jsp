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
		지도 위에서 마우스를 클릭하면 그 위치에 마커 표시
    [이벤트 처리]  
	</xmp>
	<div id="googleMap" style="width:100%; height:400px;"></div>
</div>
<script>
var lat = 37.499294;
var lng = 127.0331883;
  function myMap() {

	  var mapCenter = new google.maps.LatLng( lat, lng ); 
	  var mapCanvas = document.getElementById("googleMap") ;
	  
	  var mapOptions = {
			  
			  center: mapCenter
	          , zoom: 15
	  		};
	  var map = new google.maps.Map( 
			  mapCanvas
			  , mapOptions
			  );
	  //지도 클릭할 때 이벤트처리
	  map.addListener("click", (event)=>{
		  //alert(event.latLng);
		  placeMarker(map, event.latLng);
	  });


  }//myMap
  
  function placeMarker(map, markerCenter) {
	  //1. 마커출력
	  var marker = new google.maps.Marker({
		  position: markerCenter
		     });
	  marker.setMap(map);
	  
	  // 2. 정보창 표시
	  // var message = "<a href='http://www.sist.co.kr'>(주)쌍용교육센터</a>";
	  var message = `위도: \${markerCenter.lat()}<br>경도: \${markerCenter.lng()}`;
	  var infoWindow = new google.maps.InfoWindow(
		   {
			   content: message
		   }	  
	  );
	  infoWindow.open( map, marker );  
}//placeMarker
  
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAhvDYRhKYICQtAL2oqQinEwW2AH5fD50k&callback=myMap"></script>
</body>
</html>