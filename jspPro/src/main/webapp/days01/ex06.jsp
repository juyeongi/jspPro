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
   <%
 //scott.dept 테이블 - CRUD
 		// domain.DeptVO 한 부서 정보 저장객체
 		
  		//[dept 테이블 조회 ]
 		Connection conn= DBConn.getConnection();
 		
 		// statement 작업자 불러오기 + CRUD  ( SELECT )
 		PreparedStatement pstmt = null;   //sql 
 		String sql = " SELECT deptno, dname, loc FROM dept " ; 	 // ; 입력 x
 		ResultSet rs = null;
 		
 		//try~catch 밖에 변수선언 
 		int deptno = 0;				
 		String dname =null;
 		String loc = null;
 		DeptVO vo = null ;
 		ArrayList<DeptVO> list= null;
 		
 		try {
 			pstmt = conn.prepareStatement(sql);
 			rs = pstmt.executeQuery();

 			if(rs.next()) {
 				list = new ArrayList<>();
 				do {
 					 deptno = rs.getInt("deptno");
 					 dname = rs.getString("dname");
 					 loc = rs.getString("loc");
 					 vo = new DeptVO(deptno, dname, loc) ;
 					 list.add(vo);
 				}while (rs.next());
 			}//if
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}finally {
 			try {
 				pstmt.close();
 				rs.close();
 				DBConn.close();
 			} catch (SQLException e) {
 				e.printStackTrace();
 			}
 		}	
 		System.out.println("end");	
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
	<select name="deptno" id="deptno">
	<option>선택하세요.</option> 
    <!-- db 연동 서버만들기
    <option value="10">ACCOUNTING</option>
    <option value="20">RESEARCH</option>
    <option value="30">SALES</option>
    <option value="40">OPERATIONS</option>
    -->
    <%
    	Iterator<DeptVO> ir = list.iterator();
		while (ir.hasNext()) {
			 vo = ir.next();

	%><option value="<%=vo.getDeptno()%>"><%=vo.getDname()%></option> 
				<%
				}//while
				 %>
	</select>
</div>
<script>
	$("#deptno").change(function (event) {
		let deptno = $(this).val();   // 10,20,30,40 
		location.href= `ex06_emp.jsp?deptno=\${deptno}`; // 페이지 이동
	});
</script>
</body>
</html>