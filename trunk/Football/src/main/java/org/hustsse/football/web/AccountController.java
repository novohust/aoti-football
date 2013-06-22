package org.hustsse.football.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hustsse.football.entity.Account;
import org.hustsse.football.entity.Club;
import org.hustsse.football.entity.Coach;
import org.hustsse.football.entity.Player;
import org.hustsse.football.entity.Team;
import org.hustsse.football.service.AccountService;
import org.hustsse.football.service.ClubService;
import org.hustsse.football.service.CoachService;
import org.hustsse.football.service.PlayerService;
import org.hustsse.football.service.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	@Autowired
	private PlayerService playerService;
	@Autowired
	private CoachService coachService;

	@RequestMapping(value = "/login")
	@ResponseBody
	public AjaxResult validateAccount(Account account,HttpSession session){
		Account acc = accountService.validateAccount(account);

		if( acc == null)
		{
			return new AjaxResult(account,"wrong");
		}
		else
		{

			//登录获取身份信息
			Player player = playerService.findPlayerinfoByAccount(acc);
			Coach  coach  = coachService.findCoachinfoByAccount(acc);

			session.setAttribute("ACCOUNT", acc);
			session.setAttribute("PLAYER", player);
			session.setAttribute("COACH", coach);
			//session.setAttribute("CLUB", 2);
			return new AjaxResult(account);
		}

	}

	@RequestMapping(value="/logout")
	public String Logout(HttpSession session){

	    Account acc    =  (Account)session.getAttribute("ACCOUNT");
	    Player  palyer =  (Player)session.getAttribute("PLAYER");
	    Coach   coach  =  (Coach)session.getAttribute("COACH");
	    //String  club =  session.getAttribute("CLUB").toString();

	    session.removeAttribute("ACCOUNT");
	    session.removeAttribute("PLAYER");
	    session.removeAttribute("COACH");
	    //session.removeAttribute("CLUB");
		return "index";

	}

	//初始化index页面
	@RequestMapping(value = "/init")
	public String initIndex(ModelMap map){
		List<Club> clublist = clubService.findAllClub();
		map.put("clubMap", clublist);
		//ModelMap map =
		return "preload";

	}

	//为俱乐部获取下属球队
	@RequestMapping(value = "/getClub")
	public String  getTeams(@ModelAttribute("clubId") Long clubId, ModelMap map ){
		List<Team> teamlist = teamService.findAllTeamByClubId(clubId);
		map.put("teamMap", teamlist);
		return "team";
	}
}
