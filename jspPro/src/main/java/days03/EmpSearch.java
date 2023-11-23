package days03;

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
import domain.EmpVO;

@WebServlet("/days03/empsearch.htm")
public class EmpSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EmpSearch() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 결과물 출력
    	Connection conn= DBConn.getConnection();
		
    	PreparedStatement pstmt = null;   //sql 
    	String sql = " SELECT deptno, dname, loc FROM dept ";

    	ResultSet rs = null;

    	int deptno = 0;				
    	String dname =null;
    	String loc = null;
    	DeptVO vo = null ;
    	ArrayList<DeptVO> dlist= null;

    	try {
    		pstmt = conn.prepareStatement(sql);
    		rs = pstmt.executeQuery();

    		if(rs.next()) {
    			dlist = new ArrayList<>();
    			do {
    				deptno = rs.getInt("deptno");
    				dname = rs.getString("dname");
    				loc = rs.getString("loc");
    				vo = new DeptVO(deptno, dname, loc) ;
    				dlist.add(vo);
    			}while (rs.next());
    		}//if
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}finally {
    		try {
    			pstmt.close();
    			rs.close();

    		} catch (SQLException e) {
    			e.printStackTrace();
    		}
    	}
    	//2. job
    		sql = " SELECT DISTINCT job From emp ORDER BY job " ;

    		ArrayList<String> jlist= null;

    		try {
    			pstmt = conn.prepareStatement(sql);
    			rs = pstmt.executeQuery();
    			String job;
    			if(rs.next()) {
    				jlist = new ArrayList<>();
    				do {

    					job=rs.getString("job");
       					jlist.add(job);
    				}while (rs.next());
    			}//if
    		} catch (SQLException e) {
    			e.printStackTrace();
    		}finally {
    			try {
    				pstmt.close();
    				rs.close();
    			} catch (SQLException e) {
    				e.printStackTrace();
    			}
    		}
    		
    		//3. emp
			/*
			 * String pDeptno = request.getParameter("deptno"); // value x 
			 * if(pDeptno==null || pDeptno.equals("")) pDeptno="10";
    			deptno = Integer.parseInt(pDeptno);*/
    			
    		
    		String pdeptno = null;   // or " " ; 
    		String pjob = null;		// or " " ; 
    		
    		try {
    			String [] pdeptnos = request.getParameterValues("deptno");
        		if( pdeptnos !=null ) {
        			pdeptno = String.join(", ", pdeptnos);
        		}
        		String [] pjobs = request.getParameterValues("job");
        		if( pjobs !=null ) {
        			pjob = String.format(" '%s'  ", String.join(", ", pjobs)) ;   
        		}
			} catch (Exception e) {
				System.out.println(">EmpSearch.java  doGet() 3. 사원정보 조회");
				e.printStackTrace();
			}//catch
    		
    		sql ="SELECT empno, ename, job, mgr, to_char(hiredate,'yyyy-mm-dd') hiredate, sal, comm, deptno FROM emp "; 
    			// 체크박스 선택 위해 where 조건절 추가
    			if(pdeptno != null) {
    				sql+=  String.format(" WHERE deptno IN (%s)", pdeptno  );
    			}
    			if(pjob != null) {
    				sql+= pdeptno != null ?  " AND "  :  " WHERE "; 
    				sql+= String.format(" job IN (%s)", pjob  );
    			}//
    			sql+= " ORDER BY deptno ";
    			
    			// sql 확인
    			System.out.println(sql);
    		
    		 int empno ;
    		 String ename; 
    		 String job;
    		 int mgr;
    		 String hiredate ;
    		double sal ;
    		double comm ;
    			
    		EmpVO evo = null;
    		ArrayList<EmpVO> elist = null;
    		
    		try {
    			pstmt=conn.prepareStatement(sql);
    			rs= pstmt.executeQuery();
    				
    			if (rs.next()) {
    				elist = new ArrayList<EmpVO>();
    				do {
    					 empno = rs.getInt("empno") ;
    					 ename=rs.getString("ename");
    					 job= rs.getString("job");
    					 mgr= rs.getInt("mgr");
    					 hiredate = rs.getString("hiredate");
    					 sal =rs.getDouble ( "sal");
    					 comm=rs.getDouble ( "comm");
    					 deptno = rs.getInt("deptno");
    						 
    					 evo= new EmpVO( empno, ename,job,mgr,hiredate,sal,comm, deptno);
    					 elist.add(evo);
    				}while(rs.next());
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
    		    		
    		//ArrayList<DeptVO> list 값 포워딩 페이지에 전달될 수 있도록 request에 저장

    		request.setAttribute("dlist", dlist);
    		request.setAttribute("jlist", jlist);
    		request.setAttribute("elist", elist);
    		// 포워딩
    		String path = "/days03/ex01_empsearch_jstl.jsp";
    		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
    		dispatcher.forward(request, response);
    	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
