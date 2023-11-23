<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<script src="/jspPro/resources/cdn-main/example.js"></script>
<style>
	.material-symbols-outlined{
		vertical-align: text-bottom;
	}
</style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
  </script>

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
		[서블릿]
		1. get 방식 : 이름/ 나이 전달
		2. post 방식 : 이름/ 나이 전달
		
	</xmp>
	
<div id="tabs">
     <ul>
       <li><a href="#tabs-1">get 방식으로 서블릿 요청</a></li>
       <li><a href="#tabs-2">post 방식으로 요청</a></li>
     </ul>
     <div id="tabs-1">
       <p>
         1. 웹브라우저 : 주소창 URL 입력 후 요청<br>
         2. a 링크 태그<br>
         3. location.href 속성으로 요청<br>
         <br>
         정수 : <input type="text" id="n" name="n" value="10"><br>
         <a href="ex03_ok.jsp">ex03_ok.jsp</a>
         
       </p>
     </div>
     <div id="tabs-2">
       <p>
         <!-- action, method 속성을 지정하지 않음 -> 기본은 get방식 자기자신 페이지를 다시 요청한다. -->
         <form>
           Name : <input type="text" id="name" name="name" value="홍길동"><br>
           Age : <input type="text" id="age" name="age" value="20"><br>
           
           <input type="radio" name="method" value="get" checked="checked">Get 요청
           <input type="radio" name="method" value="post">Post 요청
           <br>
           <button type="button">전송(submit)</button>
         </form>
       </p>
     </div>
  </div>

</div>
	
</div>
<script>
  $("#tabs-2 button").on("click",function(){
     //let method = $(":radio").val();
     let method = $("#tabs-2 :radio:checked").val();
     $(this).parent() //form태그
              //.attr("method",method)
              
              //.attr("action","/contextpath/days02")
              //.attr("action","<%=contextPath%>/days02/info.htm")
              
              .attr({
                 "method":method,
                 "action":"<%=contextPath%>/days02/info.htm"
              })
              .submit();
  });
</script>


<script>
 $("#tabs-1 a").on("click",function(){
   //ex03_ok.jsp?n=10 텍스트값 파라미터를 가지고 요청
         /* 1번
         let n = $("#n").val();
         let oldHref = $(this).attr("href"); //ex03_ok.jsp //this는 a태그
         let newHref = `\${oldHref}?n=\${n}`;
         $(this).attr("href",newHref);//원래 속성값 읽어와 넘김
         
         //결과
         //http://localhost/jspPro/days02/ex03_ok.jsp?n=10 */
               
         //2번 (1번 코딩과 같음)      
         $(this).attr("href", function (i, oldhref) {//oldhref 현재 있는값
            let n = $("#n").val();
            return `\${oldhref}?n=\${n}`;
         });
 });
</script>

</body>
</html>