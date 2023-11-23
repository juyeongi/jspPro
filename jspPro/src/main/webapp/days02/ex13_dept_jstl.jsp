<%@page import="java.util.Iterator"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.DeptVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri ="http// %> --%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>

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
<select name="deptno" id="deptno">
	<option>선택하세요.</option> 
	<c:forEach items="${list }" var="vo">
		<option value="${vo.deptno }">${vo.dname }</option>
	</c:forEach>
	</select>
</div>
<script>
	$("#deptno")
						// form태그로 select태그 감싸기
				.wrap("<form></form>")
				.change(function (event) {
					$(this)   // form태그
						.parent()
						.attr({
							method :"get"
							//http://localhost/jspPro/scott/emp?deptno=30 
							// form태그가 select를 감싸고 있기 때문에 select 안의 deptno 불러올 수 있음
						  , action: "/jspPro/scott/emp"
						})
						.submit();
				});
	/* /jspPro/scott/emp  요청  서블릿 추가 */
	/* days02.ScottEmp.java */
	/* ex13_emp.jsp */
</script>
</body>
</html>