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
    ex02.jsp    쌍용교육센터 위치를 중심으로 임의의 위치 10개 마커 표시
    ex01_02.jsp 쌍용교육센터 위치에 마커 1개 표시
	</xmp>
	<div id="googleMap" style="width:100%; height:400px;"></div>
</div>

<script>
function getRndNumber(min, max) {
    return (Math.random() * (max - min) ) + min;
}
   function myMap(){
	   var lat = 37.499294;
		  var lng = 127.0331883;
     
	 var mapCenter = new google.maps.LatLng(lat, lng);
	 var mapCanvas= document.getElementById("googleMap");
	 
	 var mapOptions = {
    		  	//지도 가운데 위치(위도,경도)
      	center: mapCenter
        , zoom: 15
                    }; 
      var map = new google.maps.Map( 
      	mapCanvas
        , mapOptions 
   		)	
      /*
        //쌍용교육센터 위치 표시 마커(지도 위 객체)
      	//마커, 폴리라인, 다각형, 원, 직사각형, 정보창
      	var marker = new google.maps.Marker({
      		position : mapCenter
      		//, animation: google.maps.Animation.BOUNCE
      		, icon : "pinkball.png"
      		
      	});
      	marker.setMap(map);
      	//1
      	//var message = "<a href='http://www.sist.co.kr'>쌍용교육센터</a>";
      	//2
      	var message = "<a href='http://www.sist.co.kr'><img alt='lezhin.com 로고' src='//img-s-msn-com.akamaized.net/tenant/amp/entityid/BBFwET1.img'></a>";
      	var infoWindow= new google.maps.InfoWindow({
      		content:message;
      	});
      	infoWindow.open(map, marker);
        
                         );
        */
        for ( let i =0; i<10; i++){
        	lat += getRndNumber(-0.005, 0.005);
        	lng += getRndNumber(-0.005, 0.005);
        	//새로운 마커 위치값
        	var markerPos= document.getElementById("googleMap");
        	var marker = new google.maps.Marker({
          		position : markerPos
          	});
         	marker.setMap(map);
         	
        	var message = "맛집 -" +( i+1);
          	var infoWindow= new google.maps.InfoWindow({
          		content:message
          	});
          	infoWindow.open(map, marker);
        }
        
   }
</script> 
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAhvDYRhKYICQtAL2oqQinEwW2AH5fD50k&callback=myMap"></script>
</body>
</html>