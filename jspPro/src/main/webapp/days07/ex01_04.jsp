<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
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
		JSTL
		1) 코어 c
		2) 국제화 fmt
			: 특정 지역에 따라 알맞은 메세지를 출력할 때 사용 
		    	ㄴ 숫자/날짜 포맷팅
		    fmt:formatNumber
		    fmt:formatDate
		    fmt:parseNumber
		    fmt:parseDate
	</xmp>
	<%
		Date now = new Date();
	%>
	now :  <%=now %><br>
	<c:set var = "now" value="<%= now %>"/>
	<li><fmt:formatDate value="${now}"/></li>
	<li><fmt:formatDate value="${now}" type="date"/></li>
	<li><fmt:formatDate value="${now}" type="time"/></li>
	<li><fmt:formatDate value="${now}" type="both"/></li>
	<br>
	<li><fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일" /></li>
	<br>
	<li><fmt:formatDate value="${now}" dateStyle="default" /></li>
	<li><fmt:formatDate value="${now}" dateStyle="full" /></li>
	<li><fmt:formatDate value="${now}" dateStyle="short" /></li>
	<li><fmt:formatDate value="${now}" dateStyle="medium" /></li>
	<li><fmt:formatDate value="${now}" dateStyle="long" /></li>
	<hr>
	<%
		long price =22345;
		request.setAttribute("price", price);
	%>
	price: ${price} <br>
	<fmt:formatNumber value="${price}" type="number" pattern="#,###.00" var="fmtprice"/>
	price: ${fmtprice}
	<br>
	<fmt:formatNumber value="${price}" type="currency" currencySymbol="\\" /><br>
	<fmt:formatNumber value="${price}" type="percent"/><br>
	<hr>
	<%
		String strPrice = "1,200.34";
	// String > double 형변환
		strPrice = strPrice.replaceAll(",", ""	);
		double dprice = Double.parseDouble(strPrice);
	%>
	price : <%=dprice %> <br>
	
	<fmt:parseNumber value="<%=strPrice %>" pattern="0,000.00" var="fmtPrice"/>
	price : ${fmtPrice}<br>
	<hr>
	<%
		String strNow = "2023년 11월 01일";
		//String > Date 형변환
		// 1) year, month, day
		// Date now = new Date ( 2023-1900, 11-1, 1);
		
		//2)
		/* 
		String pattern = "yyyy년 MM월 dd일";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		Date now = sdf.parse(strNow); 
		*/
		
		//3)
		/*
		String pattern = "yyyy년 MM월 dd일";
		DateTimeFormatter df = DateTimeFormatter.ofPattern(pattern);
		LocalDate fnow = LocalDate.parse(strNow , df);
		*/
	%>
	
	<fmt:parseDate value ="<%=strNow %>" pattern="yyyy년 MM월 dd일" var="pnow"/>
	now : ${pnow}<br>
</div>
<script>

</script>
</body>
</html>