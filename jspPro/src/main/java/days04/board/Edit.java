package days04.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAOImpl;

/*@WebServlet("/cstvsboard/edit.htm")*/
public class Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Edit() {
		super();
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		int pseq = Integer.parseInt(request.getParameter("seq") );
		
		Connection conn = DBConn.getConnection();
		BoardDAOImpl dao = new BoardDAOImpl(conn);
		
		BoardDTO dto = null;
		try {
			dao.increaseReaded(pseq);  //조회수증가
			dto = dao.view(pseq);	//게시글 상세보기
		} catch (SQLException e) {
			System.out.println("> Edit.doGet() Exception!");
			e.printStackTrace();
		}
		DBConn.close();
		
		// 1. 포워딩 전에 데이터 저장
		request.setAttribute("dto", dto);

		// 2. 포워딩
		String path = "/days04/board/edit.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

	}

	// edit.jsp 작성 완료 클릭
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		 request.setCharacterEncoding("utf-8");

		 int pseq = Integer.parseInt(request.getParameter("seq"));
		 
		 
		 String pwd =  request.getParameter("pwd");
		 String email=  request.getParameter("email");
		 String title=  request.getParameter("title");
		 String content=  request.getParameter("content");
		 int tag  = Integer.parseInt(request.getParameter("tag") );
		 
		 BoardDTO dto = new BoardDTO(pseq , null, pwd, email, title, null, 0, tag, content);
		 
		 Connection conn = DBConn.getConnection();
			BoardDAOImpl dao = new BoardDAOImpl(conn);
			
			int rowCount = 0;
			try {
				rowCount = dao.update(dto);
			} catch (SQLException e) {
				System.out.println("> Edit.doPost() Exception!");
				e.printStackTrace();
			}
			DBConn.close();
			
			// 리다이렉트
			// 클라이언트에서 재요청되기 때문에 contextPath 부터 지정
			String location = "/jspPro/cstvsboard/view.htm?seq="+pseq;
			location += rowCount == 1 ? "&edit=success" : "&edit=fail";
			response.sendRedirect(location);
	}

}
