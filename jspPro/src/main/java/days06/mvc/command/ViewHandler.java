package days06.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days06.mvc.domain.BoardDTO;
import days06.mvc.domain.PageDTO;
import days06.mvc.persistence.BoardDAOImpl;


public class ViewHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(">ViewHandler.process~");
		
		int pseq = Integer.parseInt(request.getParameter("seq") );

		Connection conn = ConnectionProvider.getConnection();
		BoardDAOImpl dao = new BoardDAOImpl(conn);
		
		BoardDTO dto = null;
		try {
			dao.increaseReaded(pseq);  //조회수증가
			dto = dao.view(pseq);	//게시글 상세보기
		} catch (SQLException e) {
			System.out.println("> ViewHadler.doGet() Exception!");
			e.printStackTrace();
		}
		conn.close();
		
		// 1. 포워딩 전에 데이터 저장
		request.setAttribute("dto", dto);
		
		return "/days06/board/view.jsp";
		
	}

}
