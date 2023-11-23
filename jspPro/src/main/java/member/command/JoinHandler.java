package member.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days05.MemberInfo;
import days06.mvc.command.CommandHandler;
import member.persistence.MemberDAOImpl;


public class JoinHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod() ;  // GET, POST
		if (method.equals("GET")) {
			return "/days07/member/join.jsp";
		}else { // post
			request.setCharacterEncoding("utf-8");

			 String id = request.getParameter("id");
			 String name =  request.getParameter("name");
			 String passwd=  request.getParameter("passwd");
			 String email=  request.getParameter("email");
			 
			 MemberInfo info = new MemberInfo(id, name, passwd, null, email);
			 
			 Connection conn = ConnectionProvider.getConnection();
				MemberDAOImpl dao = new MemberDAOImpl(conn);
				
				int rowCount = 0;
				try {
					rowCount = dao.join(info);
				} catch (SQLException e) {
					System.out.println("> WriteHandler.doPost() Exception!");
					e.printStackTrace();
				}
				conn.close();
				
				// 리다이렉트
				// 클라이언트에서 재요청되기 때문에 contextPath 부터 지정
				String location = "/jspPro/member/main.do";
				location += rowCount == 1 ? "?join=success" : "?join=fail";
				response.sendRedirect(location);
		}
		return null;
	}

}
