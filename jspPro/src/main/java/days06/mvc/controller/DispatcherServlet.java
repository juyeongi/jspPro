package days06.mvc.controller;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days06.mvc.command.CommandHandler;

public class DispatcherServlet extends HttpServlet{

	private static final long serialVersionUID = 2651573099997609735L;

	private Map<String, CommandHandler> commandHandlerMap = new HashMap<>();
	@Override
	public void init() throws ServletException {
		String path =this.getInitParameter("path");
		//배포됐을 때 실제 경로 
		String realPath = this.getServletContext().getRealPath(path);
		//System.out.println(realPath);
		
		//commandHandler.properties  key, value값 
		//문자열을 값으로 불러오기
		Properties prop = new Properties();
		try (FileReader reader = new FileReader(realPath);){
			prop.load(reader);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException();
		}
		
		Set<Entry<Object, Object>> set = prop.entrySet();
		Iterator<Entry<Object, Object>> ir =set.iterator();
		while (ir.hasNext()) {
			Entry<Object,Object> entry =  ir.next();
			String url = (String)entry.getKey();
			String className = (String)entry.getValue();
			
			Class<?> commandHandlerClass =null;
			try {
				commandHandlerClass = Class.forName(className);
				CommandHandler commandHandler =  (CommandHandler) commandHandlerClass.newInstance();
				this.commandHandlerMap.put(url, commandHandler);
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				e.printStackTrace();
			}

		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println(request.getRequestURL() );    http://localhost/jspPro/days06/list.do
		//System.out.println( request.getRequestURI());    /jspPro/days06/list.do
		
		String requestURI = request.getRequestURI();
		String contextPath= request.getContextPath();
		requestURI=requestURI.replace(contextPath, "") ;
		
		// 실제 처리 객체 반환
		CommandHandler handler=this.commandHandlerMap.get(requestURI);
		
		// 반환값 페이지값으로 지정
		String viewPage = null;
		try {
			viewPage= handler.process(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// [포워딩], 리다이렉트
		if (viewPage !=null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	@Override
	// 소멸시 객체 한번 호출
	public void destroy() {
		//System.out.println(">DispatcherServlet.destroy()~");
	}

		
}
