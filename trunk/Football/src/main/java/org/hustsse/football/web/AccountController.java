package org.hustsse.football.web;

import javax.servlet.http.HttpSession;

import org.hustsse.football.entity.Account;
import org.hustsse.football.service.AccountService;
import org.hustsse.football.service.ClubService;
import org.hustsse.football.service.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
//@RequestMapping(value = "/account")
public class AccountController {

	@Autowired
	private AccountService accountService;
	@Autowired
	private ClubService   clubService;
	@Autowired
	private TeamService teamService;

	@RequestMapping(value = "/login")
	@ResponseBody
	public AjaxResult validateAccount(Account account,HttpSession session){

		if( ! (accountService.validateAccount(account)))
		{
			return new AjaxResult(account,"wrong");
		}
		else
		{
			//鑾峰彇璐︽埛瀵瑰簲鐨勪勘涔愰儴鍜岀悆闃熶俊鎭�
			//Club club = clubService.findByAccount(account);
			//Team team = clubService.findByAccount(account);

			session.setAttribute("ACCOUNT", account);
			session.setAttribute("TEAM", 10);
			session.setAttribute("CLUB", 2);
			return new AjaxResult(account);
		}

	}

	@RequestMapping(value="/logout")
	public String Logout(HttpSession session){

	    Account acc =	(Account)session.getAttribute("ACCOUNT");
	    String  team =  session.getAttribute("TEAM").toString();
	    String  club =  session.getAttribute("CLUB").toString();

	    session.removeAttribute("ACCOUNT");
	    session.removeAttribute("TEAM");
	    session.removeAttribute("CLUB");
		return "index";

	}
}
