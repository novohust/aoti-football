package org.hustsse.football.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hustsse.football.entity.Account;
import org.hustsse.football.entity.Coach;
import org.hustsse.football.entity.Player;
import org.hustsse.football.enums.RoleEnum;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class TeamInceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub

		System.out.println("TeamInterceptor!!!!!!!!!!!!!!!!!!!!!!!!!!");
		//获取传参的球队id，检查和登陆账号是否一致（管理员除外）
		String teamId = request.getParameter("teamId");
		if(teamId == null)//对于不必要的拦截，直接返回
			return true;

		long id = Long.parseLong(teamId);

		//检查session
		Account acc = (Account) request.getSession().getAttribute("ACCOUNT");
	    if(acc.getRole() == RoleEnum.Player){
	    	Player player= (Player)	request.getSession().getAttribute("PLAYER");

	    	if(player.getTeam().getId() == id)
	    		return true;
	    }
	    else if(acc.getRole() == RoleEnum.Coach){
	    	Coach  coach = (Coach)request.getSession().getAttribute("COACH");

	    	if(coach.getTeam().getId() == id)
	    		return true;

	    }else if(acc.getRole() == RoleEnum.Admin){
	    	return true;
	    }

	    //如果发现不匹配，直接重定向
	    response.sendRedirect(request.getContextPath()+"/index.jsp");
		return false;
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
