package days06.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAOImpl;

public class EditHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod() ;  // GET, POST
		if (method.equals("GET")) {
			int pseq = Integer.parseInt(request.getParameter("seq") );
			
			Connection conn = ConnectionProvider.getConnection();
			BoardDAOImpl dao = new BoardDAOImpl(conn);
			
			BoardDTO dto = null;
			try {
				dao.increaseReaded(pseq);  //조회수증가
				dto = dao.view(pseq);	//게시글 상세보기
			} catch (SQLException e) {
				System.out.println("> EditHandler.doGet() Exception!");
				e.printStackTrace();
			}
			conn.close();
			
			// 1. 포워딩 전에 데이터 저장
			request.setAttribute("dto", dto);
			return "/days06/board/edit.jsp";
		}else { // post
			request.setCharacterEncoding("utf-8");

			 int pseq = Integer.parseInt(request.getParameter("seq"));
			 
			 
			 String pwd =  request.getParameter("pwd");
			 String email=  request.getParameter("email");
			 String title=  request.getParameter("title");
			 String content=  request.getParameter("content");
			 int tag  = Integer.parseInt(request.getParameter("tag") );
			 
			 BoardDTO dto = new BoardDTO(pseq , null, pwd, email, title, null, 0, tag, content);
			 
			 Connection conn =  ConnectionProvider.getConnection();
				BoardDAOImpl dao = new BoardDAOImpl(conn);
				
				int rowCount = 0;
				try {
					rowCount = dao.update(dto);
				} catch (SQLException e) {
					System.out.println("> EditHandler.process Exception!");
					e.printStackTrace();
				}
				conn.close();
				
				// 리다이렉트
				// 클라이언트에서 재요청되기 때문에 contextPath 부터 지정
				String location = "/jspPro/board/view.do?seq="+pseq;
				location += rowCount == 1 ? "&edit=success" : "&edit=fail";
				response.sendRedirect(location);
		}
		return null;
	}

}
