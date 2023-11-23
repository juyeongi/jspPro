<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
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
<style>
	.demo {
		border: 1px solid gray;
		padding: 5px;
		margin-top: 10px;
		max-height: 500px;
		overflow: auto;
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
	<%
		String path = application.getInitParameter("filePath");
		// 엡사이트가 배포된 후의 물리적 경로 
		String realPath = application.getRealPath(path);
		
		//System.out.println(realPath);   
		//E:\Class\Workspace\JSPClass\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\jspPro\days05
		//이클립스에서 자동업로드된 경로
		
		File dir = new File(realPath);
		File [] listFiles= dir.listFiles();
	%>
	<form>
	<h3>days05</h3>
	<select id ="file" name ="file">
	<%
		for( int i =0; i<listFiles.length; i++){
			if(listFiles[i].isFile()){
	%>
			<option><%=listFiles[i].getName() %></option>
	<%
			}//if
		}//for
	%>
	</select>
	</form>
	<%
		String content = "";
		String fname =request.getParameter("file");
		fname = fname==null ? listFiles[0].getName() : fname;
		String fileName = String.format("%s\\%s", realPath, fname);		
		try(
			FileReader fr = new FileReader(fileName);
			BufferedReader br = new BufferedReader(fr);
				){
			String line= null;
			StringBuffer sb = new StringBuffer();
			while( (line=br.readLine()) !=null ){
				sb.append(line+"\r\n");	
			}
			content = sb.toString();
			content = content.replaceAll("<", "&lt;")
							.replaceAll(">", "&gt;")
							.replaceAll("\r\n", "<br>");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			
		}
	%>
	<div class="demo">
	<code>
		<%= content %>
	</code>
	</div>
</div>
<script>
	$("#file").change(function() {
		// location href = "" + $(this).val()
		// form 태그 submit
		$(this).parent().submit();
	});
	$("#file").val('<%=fname%>');
</script>
</body>
</html>