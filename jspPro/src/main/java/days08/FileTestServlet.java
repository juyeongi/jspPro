package days08;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.util.ConnectionProvider;
import com.util.JdbcUtil;

@WebServlet("*.ss")
public class FileTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FileTestServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI(); 
		
		Connection conn = null;
		String saveDirectory= null;
	
		try {
			conn = ConnectionProvider.getConnection();
			// 싱글톤 new연산자 x
			FileTestDAO dao = FileTestDAO.getInstance();
			
			if ( uri.indexOf("list.ss") != -1) {   // 자료실 목록 
				ArrayList<FileTestDTO> list = dao.selectFileList(conn);
				request.setAttribute("list", list);
				
				String path = "/days08/ex11_list.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);
			} else if ( uri.indexOf("write.ss") != -1) {  // 자료실 쓰기 + 폼
				String path = "/days08/ex11_write.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);
			} else if ( uri.indexOf("write_ok.ss") != -1) { // 자료실 쓰기 + 저장
				saveDirectory = request.getRealPath("/days08/upload/");
				System.out.println(saveDirectory);
				File f = new File(saveDirectory);
					if(! f.exists()) f.mkdirs();
					//
					int maxPostSize = 5*1024 *1024 ; // 5mb
					//
					String encoding = "UTF-8";
					//
					FileRenamePolicy policy = new DefaultFileRenamePolicy();
					
				MultipartRequest multiRequest = new MultipartRequest(
						request
						, saveDirectory
						, maxPostSize
						, encoding
						, policy
						) ;
				FileTestDTO dto = new FileTestDTO();
				String subject = multiRequest.getParameter("subject");
				dto.setSubject(subject);

				//첨부파일 유무
				File attachFile = multiRequest.getFile("attachFile");
				if (attachFile !=null) {
					String fileName = attachFile.getName();
					long filelength = attachFile.length(); // 파일크기
					// 실제 저장파일명/ 업로드시 파일명
					String originalFileName = multiRequest.getOriginalFileName("attachFile");
					String filesystemName= multiRequest.getFilesystemName("attachFile");
					
					dto.setFilelength(filelength);
					dto.setOriginalfilename(originalFileName);
					dto.setFilesystemname(filesystemName);
				}
				int rowCount= dao.insert(conn, dto);
				response.sendRedirect("list.ss");
			} else if ( uri.indexOf("delete.ss") != -1) {  // 삭제
				int num= Integer.parseInt( request.getParameter("num") );
				String filesystemname = request.getParameter("filesystemname");
				
				int rowCount = dao.delete(conn, num);
				//2. upload 폴더에 실제파일 삭제
				
				String pathname = String.format("%s\\%s" , saveDirectory, filesystemname);
		
				File deleteFile = new File(pathname);
				if (deleteFile.exists()) {
					deleteFile.delete();
				}
				response.sendRedirect("list.ss");
			} else if ( uri.indexOf("update.ss") != -1) {  // 수정 + 폼
				int num =Integer.parseInt( request.getParameter("num") ); 
				FileTestDTO dto = dao.selectOne(conn, num); // 수정 원본
				request.setAttribute("dto", dto);
				
				String path = "/days08/ex11_update.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);
			} else if ( uri.indexOf("update_ok.ss") != -1) { // 수정 + 저장

			} // if

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
