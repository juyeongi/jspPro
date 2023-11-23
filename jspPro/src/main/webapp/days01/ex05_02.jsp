<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	jsp days01
</h3>
<div>
	<xmp class="code">
		서버로 입력값 제출 (submit)
		>> 서버로 넘어가면 이전 입력값 유지 x
		
	</xmp>
	정수 : <input type="text" id="num" name="num"><br>
	<p id="demo">
	<%
		// 파라미터값 받기 전 > null
		// ?num 				> ""   파라미터 값 없이 넘어오는 경우 (빈 문자열)
		// ?num=5 			> "5"
		String num = request.getParameter("num");
		int n ;
		int sum =0;
		if (num !=null && !num.equals("")){
			n= Integer.parseInt(num);
			for(int i =1; i<=n; i++){
				%><%=i %>+<%
				sum+=i;
			}//for
			%>=<%=sum %><%
		}
	%>
	</p>
</div>
<script>
	$(function () {
		$(":text[name=num]")
			.css("text-align", "center")
			// 서버에 값 전달 후 입력값 유지
				// 파라미터값을 value속성으로 입력
			<%-- .val('<%=num==null?"":num%>') --%>
			.val('${param.num}')	// EL
			.keyup(function (event) {
				if(event.which==13){ //엔터칠 때 submit
					let num = $(this).val(); // 입력받은 값
					// 서버에 자기자신 페이지를 재요청
					location.href="ex05_02.jsp?num="+num;		
				}//if
		});
	});
			
</script>
</body>
</html>