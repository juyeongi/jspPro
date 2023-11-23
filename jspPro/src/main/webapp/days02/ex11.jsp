<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		//?ok
	String ok = request.getParameter("ok");   //인증성공
	String name = request.getParameter("name");  //인증성공
		//?error
	String error = request.getParameter("error");   //인증실패
%>
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
		ex11.jsp 호출 > id/passwd > 로그인
		ex11_ok.jsp 로그인 성공/실패여부 체크
								리다이렉트
			로그인성공 >   ex11.jsp?ok&name=로그인이름
			로그인 실패 >  ex11.jsp?error
	</xmp>
	<div id = "logon">
		<form action="ex11_ok.jsp" method="get">
		아이디: <input type="text" name = "id" value ="admin"> <br>
		비밀번호: <input type="password" name="passwd" value="1234"> <br>
		<input type="submit" value="logon">
		</form>
	</div>
	<div id = "logout">
		[<%= name %>]님 로그인 하셨습니다. <br>
		<button>로그아웃</button>
	</div>
	
	<a href="#">설문조사</a>
	<!-- 로그인 후 이용 가능 -->
	<%
		if(ok !=null){	// ""
	%>
	<a href="#">일정관리</a>
	<a href="#">게시판</a>
	
	<script>
	$(function () {
		alert(" 로그인 성공 ~ ");
		$("#logon").hide();
		$("#logout").show();
	});
	</script>
	<%		
		}
	%>
	<%
	if( error != null){
	%>
	<script>
		$(function () {
			alert(" 로그인 실패 ~ ");
		});
	</script>
	<%
	}
%>

</div>
<script>
	$("#logout").hide()	;
</script>
</body>
</html>