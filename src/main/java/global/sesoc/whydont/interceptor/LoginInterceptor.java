package global.sesoc.whydont.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//logger.info("LoginInterceptor============>");
		//요청객체로부터 뽑아냄 세션의 로그인 정보를 알아냄
		HttpSession session=request.getSession();
		String loginId = (String) session.getAttribute("loginId");
		String tloginId = (String) session.getAttribute("tloginId");
		//loginId하고 tloginId가 null이면 로그인 하지 않은 상태임
		if(loginId == null && tloginId == null) {
			//로그인 화면으로 이동함
			//context path를 뽑아냄
			String contextPath = request.getContextPath();
			
			response.sendRedirect(contextPath + "/login");
			return false;
		}else {
			return true;
		}
		
	}
	
}
