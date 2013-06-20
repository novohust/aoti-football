package org.hustsse.football.web;

import org.hustsse.football.entity.Account;
import org.hustsse.football.service.AccountService;
import org.hustsse.football.service.ClubService;
import org.hustsse.football.service.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value = "/player")
public class PlayerController {

	@Autowired
	private AccountService accountService;
	@Autowired
	private ClubService   clubService;
	@Autowired
	private TeamService teamService;

	@RequestMapping(value = "/introduction")
	public String getIntroduction(Account account){
		return "player_intro";
	}

	@RequestMapping(value="/data")
	public String Logout(Account account){
		return "player_intro";
	}
}
