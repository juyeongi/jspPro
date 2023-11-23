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
	<button onclick="getPersonJson()">로컬 저장소의 personJson 사용</button>
	<p id="demo"></p>
</div>
<script>
	//1. js Object 
	var person={
			name:"john"
			, age:20
			, city:"seoul"
	};
	
	//2. person js객체 > json 데이터 변환
	let personJson = JSON.stringify(person);
	//console.log("personJson",personJson);
	//3. 로컬저장소에 저장 (로커스토리지)
	localStorage.setItem("personJson",personJson);
	
</script>
<script>
	function getPersonJson() {
		let personJson= localStorage.getItem("personJson");
		//json 테이터> js 객체 변환 : parse   // 필드 접근성 
		let person = JSON.parse(personJson);
		$("#demo").html(person.name+ "/" +person.age);
		
		//localStorage.removeItem("personJson");
		//localStorage.clear();
	}
</script>
</body>
</html>