<%@page import="domain.EmpVO"%>
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
   <%
   String pDeptno= null;

   if(pDeptno ==null || pDeptno.equals("")) pDeptno="10";
   		
   
		int deptno2 = Integer.parseInt(pDeptno);
		String sql2 ="SELECT empno, ename, job, mgr, to_char(hiredate,'yyyy-mm-dd') hiredate, sal, comm, deptno FROM emp WHERE deptno = ?"; 
		PreparedStatement pstmt2= null;
		ResultSet rs2 = null;
		ArrayList<EmpVO> list2 = null;
		
		 int empno ;
		 String ename; 
		 String job;
		 int mgr;
		 String hiredate ;
		double sal ;
		double comm ;
		
		EmpVO vo2 = null;
		
		conn = DBConn.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, deptno);
			rs= pstmt.executeQuery();
			
			if (rs.next()) {
				list2 = new ArrayList<EmpVO>();
				do {
					 empno = rs.getInt("empno") ;
					 ename=rs.getString("ename");
					 job= rs.getString("job");
					 mgr= rs.getInt("mgr");
					 hiredate = rs.getString("hiredate");
					 sal =rs.getDouble ( "sal");
					 comm=rs.getDouble ( "comm");
					 deptno = rs.getInt("deptno");
					 
					 vo2= new EmpVO( empno, ename,job,mgr,hiredate,sal,comm, deptno);
					 list.add(vo);
				}while(rs.next());
			}//if
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
		}
	
		pstmt.close();
		DBConn.close();
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
    <%
    	Iterator<DeptVO> ir = list.iterator();
		while (ir.hasNext()) {
			 vo = ir.next();
	%><option value="<%=vo.getDeptno()%>"><%=vo.getDname()%></option> 
				<%
				}//while
				 %>
	</select>

<h2>emp list</h2>
	<table>
		<thead>
			<tr>
		<td><input type="checkbox">전체선택</input></td>
		<td>empno</td>
        <td>ename</td>
        <td>job</td>
        <td>mgr</td>
        <td>hiredate</td>
        <td>sal</td>
        <td>comm</td>
        <td>deptno</td>
			</tr>
		</thead>
		<tbody>
			<%
				if( list2 == null ){  //사원 x
				%>
				<tr>
					<td colspan="9">사원 존재 x</td>
				</tr>
				<%
				}else{
					Iterator<EmpVO> ir2 = list2.iterator();
					while(ir2.hasNext()){
						vo2= ir2.next();
				%>
					<tr>
		<td><input type="checkbox"></input></td>	
		<td><%=vo2.getEmpno() %></td>
        <td><%=vo2.getEname() %></td>
        <td><%=vo2.getJob() %></td>
        <td><%=vo2.getMgr() %></td>
        <td><%=vo2.getHiredate() %></td>
        <td><%=vo2.getSal() %></td>
        <td><%=vo2.getComm() %></td>
        <td><%=vo2.getDeptno() %></td>
			</tr>
				<%
					}
				}
			%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="9">
				<button style="margin: auto; display: block;">확인</button>
				</td>
			</tr>
		</tfoot>
	</table>

</div>
<script>

	$("#deptno").change(function (event) {
		let deptno = $(this).val();   // 10,20,30,40 
		
		alert( $("tbody").val() ); 
	});
/*
	$("#subject").change(function () {
		let value = $(this).val();
		//let text = $(this).find(":selected").text();
		let text = $("#subject option:selected").text();
		
	});
	*/
</script>
</body>
</html>