package org.hustsse.football.service;

import org.hustsse.football.dao.TeamDao;
import org.hustsse.football.entity.Team;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class TeamService {

	@Autowired
	TeamDao teamDao;

	@Transactional(readOnly = false)
	public void add(Team t) {
		teamDao.save(t);
	}

	public Team findById(Long id) {
		return teamDao.findUniqueBy("id", id);
	}
}