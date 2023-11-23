package days06.mvc.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandHandler {
	// 리턴값 > 응답하는 페이지 (view)
	// 컨트롤러에서 처리오류시 알려주기위해 throws처리
	String process(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
