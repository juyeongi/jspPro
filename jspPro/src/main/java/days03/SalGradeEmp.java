package days03;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import domain.DeptEmpSalgradeVO;
import domain.SalgradeVO;

@WebServlet("/days03/salgradeEmp.htm")
public class SalGradeEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SalGradeEmp() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> SalGradeEmp.doGet() ");
		//
		//등급
		String sql = "SELECT grade, losal, hisal, COUNT (*) cnt "
				+ "FROM salgrade s JOIN emp e ON sal BETWEEN losal AND hisal "
				+ "GROUP BY grade, losal, hisal "
				+ "ORDER BY grade ASC";
		//emp정보
		String empsql = "SELECT d.deptno , dname, empno, ename, sal "
				+ "FROM dept d RIGHT JOIN emp e ON d.deptno = e.deptno "
				+ "    JOIN salgrade s ON sal BETWEEN losal AND hisal "
				+ "WHERE grade =? ";

		Connection conn = null;
		ResultSet rs = null, emprs = null;
		PreparedStatement pstmt = null, emppstmt = null;
		LinkedHashMap<SalgradeVO, ArrayList<DeptEmpSalgradeVO>> map = new LinkedHashMap<>();
		SalgradeVO vo= null;  //key
		ArrayList<DeptEmpSalgradeVO> emplist = null;  //value
		DeptEmpSalgradeVO empvo= null;

		int deptno;
		String dname;
		int empno ;
		String ename;
		double sal ;
		int grade ;

		conn = DBConn.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			//pstmt sql ? 파라미터값 유무 확인
			rs=pstmt.executeQuery();

			if (rs.next()) {
				do {
					grade =rs.getInt(1);
					// vo   key
					vo= new SalgradeVO(rs.getInt(1)
							,rs.getInt(2)
							,rs.getInt(3)
							,rs.getInt(4));
					//empsql 실행
					emppstmt = conn.prepareStatement(empsql);
					emppstmt.setInt(1, grade);
					emprs = emppstmt.executeQuery();

					if (emprs.next()) {
						emplist = new ArrayList<DeptEmpSalgradeVO>();
						do {
							deptno = emprs.getInt(1);
							dname = emprs.getString(2);
							empno = emprs.getInt(3);
							ename = emprs.getString(4);
							sal = emprs.getDouble(5) ;

							empvo = new DeptEmpSalgradeVO(deptno, dname, empno, ename, sal, grade);
							//value
							emplist.add(empvo);

						} while (emprs.next());
						map.put(vo, emplist);

						emprs.close();
						emppstmt.close();
					}//if

				} while (rs.next());
			}//if
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close(); 
				pstmt.close(); 
				DBConn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		// 1. LinkedHashMap<SalgradeVO, ArrayList<DeptEmpSalgradeVO>> map 저장
		request.setAttribute("map", map);
		
		// 2. 포워딩
		String path = "/days03/ex04_salgradeemp.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
