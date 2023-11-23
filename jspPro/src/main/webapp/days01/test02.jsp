<%@page import="java.util.Iterator"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConn"%>
<%@page import="domain.EmpVO"%>
<%@page import="java.beans.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   //http://localhost/jspPro/days01/ex06_emp.jsp
   //?
   //deptno=40
   //JDBC - days02. ex01
   Connection conn = null;

		String sql ="SELECT empno, ename, job, mgr, 	to_char(hiredate,'yyyy-mm-dd'), sal, comm, d.deptno FROM emp e RIGHT JOIN dept d ON e.deptno = d.deptno WHERE d.deptno = %d"; 
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		ArrayList<EmpVO> list = null;
		
		int deptno;
		 int empno ;
		 String ename; 
		 String job;
		 int mgr;
		 String hiredate ;
		double sal ;
		double comm ;
		
		EmpVO vo = null;
		
		conn = DBConn.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			
			if (rs.next()) {
				list = new ArrayList<EmpVO>();
				do {
					 empno = rs.getInt("empno") ;
					 ename=rs.getString("ename");
					 job= rs.getString("job");
					 mgr= rs.getInt("mgr");
					 hiredate = rs.getString("hiredate");
					 sal =rs.getDouble ( "sal");
					 comm=rs.getDouble ( "comm");
					 deptno = rs.getInt("deptno");
					 
					 vo= new EmpVO( empno, ename,job,mgr,hiredate,sal,comm, deptno);
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
	jsp days01
</h3>
<div>
	<xmp class="code">
		
	</xmp>
	<h2>emp list</h2>
	<table>
		<thead>
			<tr>
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
				if( list == null ){  //사원 x
				%>
				<tr>
					<td colspan="8">사원 존재 x</td>
				</tr>
				<%
				}else{
					Iterator<EmpVO> ir = list.iterator();
					while(ir.hasNext()){
						vo= ir.next();
				%>
					<tr>
		<td><%=vo.getEmpno() %></td>
        <td><%=vo.getEname() %></td>
        <td><%=vo.getJob() %></td>
        <td><%=vo.getMgr() %></td>
        <td><%=vo.getHiredate() %></td>
        <td><%=vo.getSal() %></td>
        <td><%=vo.getComm() %></td>
        <td><%=vo.getDeptno() %></td>
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

</script>
</body>
</html>