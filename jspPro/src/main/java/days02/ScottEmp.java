package days02;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import domain.EmpVO;

@WebServlet("/scott/emp")
public class ScottEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ScottEmp() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		Connection conn = null;
		   
		   String pDeptno = request.getParameter("deptno");
		   		//  				//value x
		   if(pDeptno ==null || pDeptno.equals("")) pDeptno="10";
		   		
		   
				int deptno = Integer.parseInt(pDeptno);
				String sql ="SELECT empno, ename, job, mgr, to_char(hiredate,'yyyy-mm-dd') hiredate, sal, comm, deptno FROM emp WHERE deptno = ?"; 
				PreparedStatement pstmt= null;
				ResultSet rs = null;
				ArrayList<EmpVO> list = null;
				
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
					pstmt.setInt(1, deptno);
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
				try {
					pstmt.close();
					DBConn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				//포워딩
				request.setAttribute("list", list);

				//String path = "/days02/ex13_emp.jsp";
				String path = "/days02/ex13_emp_jstl.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
