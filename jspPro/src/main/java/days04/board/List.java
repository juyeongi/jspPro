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
import days04.board.domain.PageDTO;
import days04.board.persistence.BoardDAOImpl;

@WebServlet("/cstvsboard/list.htm")
public class List extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public List() {
        super();

    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage= 1; // 현재 페이지번호 (기본값)
		int numberPerPage= 10; // 한 페이지에 출력할 게시글 수
		int numberOfPageBlock = 10; //페이지블럭 수 
		int totalRecords = 0; // 레코드 수
		int totalPages= 0;
		
		//검색기능 구현
		int searchCondition = 1;	// 검색조건이 파라미터로 넘어왔을 때
		try { // 파라미터로 페이지버놓가 넘어오지 않으면(오류) 기본값 1로 유지
			currentPage= Integer.parseInt( request.getParameter("currentpage") );
		} catch (Exception e) {}//catch
		String searchWord= request.getParameter("searchWord");
		// 파라미터 x  null
		// 파라미터값 x "" 
		// null, "" 다 ""로 치환
		if(searchWord==null) searchWord = "";	// 검색조건이 파라미터로 안넘어왔을 때 
		
		ArrayList<BoardDTO> list =null;
		
		Connection conn = DBConn.getConnection();
		BoardDAOImpl dao = new BoardDAOImpl(conn);
		PageDTO pDto = null;
		try {
			if (searchWord.equals("")) {
				list =dao.select(currentPage, numberPerPage);
				totalRecords = dao.getTotalRecords();
				totalPages = dao.getTotalPages(numberPerPage);
			} else {
				list =dao.Search(currentPage, numberPerPage, searchCondition, searchWord); // 검색조건 함수
				// 검색된 페이지 수
				totalPages = dao.getTotalPages(numberPerPage,searchCondition,searchWord);

			}//if
			
			
			pDto= new PageDTO(currentPage, numberPerPage, numberOfPageBlock, totalPages);
		} catch (SQLException e) {
			System.out.println("> List.doGet() Exception!");
			e.printStackTrace();
		}
		DBConn.close();
		
		// 1. 포워딩 전에 데이터 저장
		request.setAttribute("list", list);
		request.setAttribute("pDto", pDto);
		// 2. 포워딩
		String path = "/days04/board/list.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
