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
	
	
</div>
<script>
function isValid_id(str){ 
    var patten = new Array();
    var msg = new Array();
    var p;
    var ret_msg = new Array();
    
    //patten["not_eng_num"] =/[a-zA-Z0-9_-]$/;  //a-z와 0-9 _ - 이외의 문자가 있는지 확인
    //msg["not_eng_num"] = "영문, 숫자 ,특수기호(_)만 사용가능합니다.";
    //patten["not_eng_num"] =/^[a-zA-Z0-9]+$/g;  //a-z와 0-9 _ - 이외의 문자가 있는지 확인    
    //msg["not_eng_num"] = "영문 대/소문자/숫자만 사용가능합니다.";
    patten["not_eng_num"] =/^[a-z0-9]+$/g;  //a-z와 0-9 이외의 문자가 있는지 확인    
    msg["not_eng_num"] = "영문 소문자/숫자만 사용가능합니다.";
    //patten["len"] = /^\w{6,12}$/;	// 문자열 길이
    patten["len"] = /^\w{6,12}$/;	// 문자열 길이
    msg["len"] = "6~12자리로 사용가능합니다.";
    patten["only_num"] = /[a-zA-Z]/;// 숫자만
    msg["only_num"] = "영문 소문자/숫자의 혼용으로 사용가능합니다(숫자만으로는 사용불가).";
    //patten["only_alpha"] = /[0-9]/; // 영문만
    //msg["only_alpha"] = "영문 대/소문자/숫자의 혼용으로 사용가능합니다(영문 대/소문자만으로 사용불가).";



  
	 var retVal = checkSpace( str );
	 if( retVal ) {
		 alert("아이디는 빈 공간 없이 연속된 영문 소문자와 숫자만 사용할 수 있습니다.");
		 return false;
	 }

	/*
	if( str.charAt(0) == '_') {
		alert("아이디의 첫문자는 '_-'로 시작할수 없습니다.");
		return false;
	}
	*/

	// 패턴 체크 
	var i=0;
	for (x in patten)
	{
		p = eval(patten[x]);
		if(!p.test(str))
		{
			ret_msg[i] = msg[x];
			i++;
		} 
	}

	if(i>0) {
		//alert(ret_msg.join('\n'));
		alert("6~12자리의 영문 소문자,숫자 혼용으로 사용가능합니다.");
		return false;
	}
	else return true;
}
</script>
</body>
</html>