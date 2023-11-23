<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String contextPath = request.getContextPath();
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
		
	</xmp>
	
	<h2>글수정</h2>
	<form method="post">
		<table>
		<tr>
            <td colspan="2" align="center"><b>글을 수정해주세요</b></td>
         </tr>
         <tr>
            <td align="center">이름</td>
            <td><input type="text" name="writer" size="15"
     				 disabled="disabled" value = "${dto.writer}"></td>
         </tr>
         <tr>
            <td align="center">비밀번호</td>
            <td><input type="password" name="pwd" size="15" required="required"></td>
         </tr>
         <tr>
            <td align="center">Email</td>
            <td><input type="email" name="email" size="50" value = "${dto.email}"></td>
         </tr>
         <tr>
            <td align="center">제목</td>
            <td><input type="text" name="title" size="50" value = "${dto.title}"></td>
         </tr>
         <tr>
            <td align="center">내용</td>
            <td><textarea name="content" cols="50" rows="10">"${dto.content}"</textarea></td>
         </tr>
         <tr>
            <td align="center">HTML</td>
            <td><input type="radio" name="tag" value="1">적용
               <input type="radio" name="tag" value="0">비적용</td>
               <script>
               		$(":radio[name=tag][value=${dto.tag}]").attr("checked", "checked");
               </script>
         </tr>
         <tr>
            <td colspan="2" align="center">
              <input type="submit" value="작성 완료">
              &nbsp;&nbsp;&nbsp; 
              <a href="javascript:history.back();"></a>
            </td>
         </tr>
		</table>
	</form>
	
</div>
<script>
	$("form").submit(function (event) {
		alert("유효성검사");
		event.preventDefault();   // 이벤트 취소
	})
</script>
</body>
</html>