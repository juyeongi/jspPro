package days06.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAOImpl;

public class WriteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod() ;  // GET, POST
		if (method.equals("GET")) {
			return "/days06/board/write.jsp";
		}else { // post
			request.setCharacterEncoding("utf-8");

			 String writer = request.getParameter("writer");
			 String pwd =  request.getParameter("pwd");
			 String email=  request.getParameter("email");
			 String title=  request.getParameter("title");
			 String content=  request.getParameter("content");
			 int tag  = Integer.parseInt(request.getParameter("tag") );
			 
			 BoardDTO dto = new BoardDTO( 0, writer, pwd, email, title, null, 0, tag, content);
			 
			 Connection conn = DBConn.getConnection();
				BoardDAOImpl dao = new BoardDAOImpl(conn);
				
				int rowCount = 0;
				try {
					rowCount = dao.insert(dto);
				} catch (SQLException e) {
					System.out.println("> WriteHandler.doPost() Exception!");
					e.printStackTrace();
				}
				DBConn.close();
				
				// 리다이렉트
				// 클라이언트에서 재요청되기 때문에 contextPath 부터 지정
				String location = "/jspPro/board/list.do";
				location += rowCount == 1 ? "?write=success" : "?write=fail";
				response.sendRedirect(location);
		}
		return null;
	}

}
