package days02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/* ==web.xml <servlet> + <servlet-mapping>*/
/*@WebServlet(
		description = "두 번째 서블릿 예제 - 어노테이션 기반"
		, urlPatterns = { "/Hello" , "/days02/hello.html"})
*/
public class Hello extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Hello() {
        super();
   
    }

		//get, post요청
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.append("hi~");
	}
		//get요청
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
		//post요청
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
