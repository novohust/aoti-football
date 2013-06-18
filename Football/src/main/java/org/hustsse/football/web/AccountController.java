package org.hustsse.football.web;

import org.hustsse.football.entity.Account;
import org.hustsse.football.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/account")
public class AccountController {

	@Autowired
	private AccountService accountService;

	@RequestMapping(value = "/login")
	@ResponseBody
	public AjaxResult validateAccount(Account account){
		accountService.validateAccount(account);
		return null;

	}


}
