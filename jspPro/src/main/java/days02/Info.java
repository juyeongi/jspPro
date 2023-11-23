package days02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Sequence;

/*@WebServlet("/days02/info.htm")*/
public class Info extends HttpServlet {
	private static final long serialVersionUID = 1L;
											//고유번호
    public Info() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html; charset=UTF-8");
		
		String name = request.getParameter("name");
		int age=Integer.parseInt( request.getParameter("age") );
		
		PrintWriter out = response.getWriter();
		out.append("GET 방식 요청 <br>")
			.append("> 이름 : "+name+ "<br>")
			.append("> skdl : "+age+ "<br>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 브라우저 > 서블릿
		//  홍길동
		//			> IOS-8859-1 인코딩. (post 요청)
		//			> UTF-8 인코딩 ( get 요청)
		// meta 태그의 인코딩: 브라우저
		
		// 서버에 보내는 인코딩  한글깨짐처리
		request.setCharacterEncoding("UTF-8");    // 파라미터로 넘어갈 때 인코딩
		response.setContentType("text/html; charset=UTF-8");   // 서버에서 응답할 때 인코딩
		String name = request.getParameter("name");
		int age=Integer.parseInt( request.getParameter("age") );
		
		PrintWriter out = response.getWriter();
		out.append("POST 방식 요청 <br>")
			.append("> 이름 : "+name+ "<br>")
			.append("> skdl : "+age+ "<br>");
	}

}
