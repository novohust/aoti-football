package org.hustsse.football.service;

import org.hustsse.football.dao.AccountDao;
import org.hustsse.football.entity.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class AccountService {

	@Autowired
	AccountDao accountDao;

	@Transactional(readOnly = false)
	public void add(Account t) {
		accountDao.save(t);
	}

	public Account findById(Long id) {
		return accountDao.findUniqueBy("id", id);
	}
}