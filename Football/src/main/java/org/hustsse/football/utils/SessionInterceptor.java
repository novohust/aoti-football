package org.hustsse.football.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hustsse.football.entity.Account;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


//鎷︽埅鍣�
public class SessionInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub

		//妫�煡鏄惁鐧诲綍
		System.out.println("preHandle teshjhjkkjjjjjjjjjj!!!!!!!!!!!!!!!!!!!t");
		Account acc = (Account) request.getSession().getAttribute("ACCOUNT");

		if(acc == null){
			response.sendRedirect(request.getContextPath()+"/index.jsp");
			return false;
		}
		else
			return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
