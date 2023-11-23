package days04.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAOImpl;

/*@WebServlet("/cstvsboard/delete.htm")*/
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Delete() {
        super();

    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage= 1; // 현재 페이지번호 (기본값)
		int numberPerPage= 10; // 한 페이지에 출력할 게시글 수
		int numberOfPageBlock = 10; //페이지블럭 수 
		int total = 0; // 레코드 수 
		
		//검색기능 구현
		try { // 파라미터로 페이지번호가 넘어오지 않으면(오류) 기본값 1로 유지
			currentPage= Integer.parseInt( request.getParameter("currentpage") );
		} catch (Exception e) {}//catch
		
		ArrayList<BoardDTO> list =null;
		
		Connection conn = DBConn.getConnection();
		BoardDAOImpl dao = new BoardDAOImpl(conn);
		
		try {
			list =dao.select(currentPage, numberPerPage);
		} catch (SQLException e) {
			System.out.println("> List.doGet() Exception!");
			e.printStackTrace();
		}
		DBConn.close();
		
		// 1. 포워딩 전에 데이터 저장
		request.setAttribute("list", list);
		// 2. 포워딩
		String path = "/days04/board/delete.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		request.setCharacterEncoding("utf-8");

		 int pseq = Integer.parseInt(request.getParameter("seq"));
		 
		 
		 String pwd =  request.getParameter("pwd");
		
		 Connection conn = DBConn.getConnection();
			BoardDAOImpl dao = new BoardDAOImpl(conn);
			
			int rowCount = 0;
			String originalPwd;
			String location= null;
			try {
				// 글삭제 : 글 비밀번호 == 입력한 비밀번호 
				originalPwd = dao.getOriginalPwd(pseq);

				if (originalPwd.equals(pwd)) {
					rowCount = dao.delete(pseq);
					location = "/jspPro/cstvsboard/list.htm?delete=success";
				} else {
					/*
					//비밀번호 입력오류
					//1. 경고창
					//2. deletd.jsp
					request.setAttribute("error","비밀번호 틀렸다");
					doGet(request, response);
					return;
					*/
					location = "/jspPro/cstvsboard/view.htm?seq="+pseq+"&delete=fail";
				}

			} catch (SQLException e) {
				System.out.println("> Delete.doPost() Exception!");
				e.printStackTrace();
			} finally {
				DBConn.close();
			}
			
			// 리다이렉트
			// 클라이언트에서 재요청되기 때문에 contextPath 부터 지정
		
			response.sendRedirect(location);
	}

}
