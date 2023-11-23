package days08;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/*@WebServlet("/UploadServlet")*/
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UploadServlet() {
        super();
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		//request.getPart();
		Collection<Part> parts =request.getParts();
		
		PrintWriter out = response.getWriter();
		out.print("<html>");
		out.print("<body>");
		
		String contentType= request.getContentType();
		//multipart 시작
		if (contentType !=null && contentType.toLowerCase().startsWith("multipart/")) {
			printPartinfo(request, out);
		} else {
			out.print(">multipart 아님");
		}
		
		out.print("</body>");
		out.print("</html>");
		
		
	}

	private void printPartinfo(HttpServletRequest request, PrintWriter out) throws IOException, ServletException {
		Collection<Part> parts =request.getParts();
		for (Part part : parts) {
			out.print("<br>name : "+part.getName());
			String contentType = part.getContentType();
			if (part.getHeader("Content-Disposition").contains("filename=")) {
				//첨부파일이 있을 경우
				out.print("<br> size :" + part.getSize());
				String fileName =part.getSubmittedFileName(); //업로드된 파일이름 가져오기
				out.print("<br> fileName :" + fileName);
				if (part.getSize()> 0) {
					part.write("c:\\temp\\" + fileName); // 저장경로
					part.delete(); // 임시파일 삭제
				} else {
					String paramValue = request.getParameter(part.getName());
					out.println("<br> paramValue :" + paramValue);
				}
				out.print("<br>");
			}
		}
	}

}
