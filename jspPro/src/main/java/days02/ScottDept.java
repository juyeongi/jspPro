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

import domain.DeptVO;

/**
 * Servlet implementation class ScottDept
 */
@WebServlet("/scott/dept")
public class ScottDept extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ScottDept() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// dept 부서정보 담기
		Connection conn= DBConn.getConnection();

		PreparedStatement pstmt = null;   //sql 
		String sql = " SELECT deptno, dname, loc FROM dept " ;
		ResultSet rs = null;

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
		
		//ArrayList<DeptVO> list 값 포워딩 페이지에 전달될 수 있도록 request에 저장
		request.setAttribute("list", list);
		
		//http://localhost/jspPro/scott/dept 설정 url
		//String path = "ex13_dept.jsp";
		// 포워딩 > http://localhost/jspPro/scott/dept/ex13_dept.jsp   >> 404오류
		// 가져온 부서정보 포워딩
		String path = "/days02/ex13_dept_jstl.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
