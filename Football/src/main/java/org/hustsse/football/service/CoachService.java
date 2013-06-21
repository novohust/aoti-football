package org.hustsse.football.service;

import java.util.List;

import org.hustsse.football.dao.CoachDao;
import org.hustsse.football.entity.Account;
import org.hustsse.football.entity.Coach;
import org.hustsse.football.entity.Player;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class CoachService {

	@Autowired
	CoachDao coachDao;

	@Transactional(readOnly = false)
	public void add(Coach t) {
		coachDao.save(t);
	}

	public Coach findById(Long id) {
		return coachDao.findUniqueBy("id", id);
	}

	public Coach findCoachinfoByAccount(Account account){
		List<Coach> coachlist = coachDao.find("from Coach p where p.account.id = ?",account.getId());
		if(coachlist.size() > 0)
		{
			return (Coach) coachlist.get(0);
		}
		else
			return null;
	}
}