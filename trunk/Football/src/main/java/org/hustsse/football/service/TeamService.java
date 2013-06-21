package org.hustsse.football.service;

import org.hustsse.football.dao.TeamDao;
import org.hustsse.football.entity.Account;
import org.hustsse.football.entity.Player;
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

	public List<Player> findTeamPlayers(Long teamId) {
		return teamDao.find("from Player p where p.team.id = ?", teamId);
	}

	public List<Team> findAllTeamByClubId(Long clubId){
		return teamDao.find("from Team t where t.club.id = ?",clubId);
	}

}