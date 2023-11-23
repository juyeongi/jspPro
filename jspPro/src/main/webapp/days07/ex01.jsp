<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="days05.MemberInfo"%>
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
	<xmp class="code">
		[코어 라이브러리]
    1. 제어문    - c:if, c:choose, c:forEach 제어문 + c:forTokens X
    2. URL 처리  - c:import, c:rediect, c:url
    3. 변수 지원 - c:set    c:remove
    	1)c:set c태그 사용 - 변수 선언/할당
    	c:set property="" 	설정할 속성
    									* 자바빈의 setter 성정 후 사용 가능
    			scope="" 		페이지 영역
    			target="" 		속성(property)값을 설정할 대상 객체 (표현식, EL, 컬렉션, 자바빈, Map객체 사용가능)
    			value="" 		변수 값 (고정된값 "홍길동" , 표현식, 표현언어EL 사용 가능)
    			var=""			EL에서 사용할 변수명
    4. 기타      - c:catch   c:out(JspWriter에 내용 출력)
  	

  	</xmp>
	<%
		String name = "홍길동";
		request.setAttribute("name", name);   /* EL 사용시 선언해야함 */
	%>
	name(표현식): <%= name %><br>
	
	<c:set var="name1" value="홍길동"></c:set>
	<c:set var="name2" value="<%=name %>"></c:set>
	<c:set var="name3" value="${name }"/>
		== <c:set var="name4">${name}</c:set>	
	<hr>
	<%
		/* 자바빈 객체생성 */
		MemberInfo m = new MemberInfo();
		m.setId("admin");
		m.setName("관리자");
	%>
	<c:set var="vo" value="<%=m %>"/>
	id : ${vo.id}<br>
	<hr>
	<c:set target="<%=m %>" property="id" value="hong"/>
											<!-- id 속성에 대한 값 변경 -->
	<c:set target="${vo}" property="name" value ="홍길동"/>
	<hr>
	<%
		Map<String, String> map = new HashMap<>();
		map.put("id", "admin");
		map.put("passwd", "1234");
	%>
	<c:set var="x" value="<%=map %>"></c:set>
	id : ${x.id } <br>
	pwd : ${x.passwd } <br>
</div>
<script>

</script>
</body>
</html>