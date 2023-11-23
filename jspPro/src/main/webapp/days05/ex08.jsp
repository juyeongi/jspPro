<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
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
		[커넥션 풀 ( connection pool )]
		Documentation > Apache Tomcat 8.5 > 10) JDBC DataSources
		https://tomcat.apache.org/tomcat-8.5-doc/jndi-datasource-examples-howto.html#Oracle_8i,_9i_&_10g
		1. DBCP 이용해서 커넥션풀 사용
		*** 2. WAS(톰캣)을 이용한 커넥션풀 사용 ***
				1) tomcat-dbcp.jar
				톰켓경로 > lib > tomcat-dbcp.jar > javaPro lib폴더에 복사
				2) 커넥션풀 설정
					META-INF 폴더 > context.xml 파일 추가 
					
			maxTotal="20"  > pool 안에 만들수 있는 커넥션객체 갯수 ( -1 : 제한 x) 
            maxIdle="10"  >사용되지 않고 대기중인 커넥션 유효갯수
            maxWaitMillis="-1"  > 커넥션 모두 사용시 대기 시간( -1 : 제한x)
	</xmp>
	<!-- 연결 확인 -->
	<%
	/*
	Context initContext = new InitialContext();
	Context envContext  = (Context)initContext.lookup("java:/comp/env");
	DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
	Connection conn = ds.getConnection();
	//etc.
	*/
		// com.util.ConnectionProvider.java 생성
	Connection conn = ConnectionProvider.getConnection();
	%>
	conn = <%=conn %><br>
	conn.state = <%=conn.isClosed() %><br>
	<%
		conn.isClosed(); // 커넥션풀에 자동으로 반환
	%>
</div>
<script>

</script>
</body>
</html>