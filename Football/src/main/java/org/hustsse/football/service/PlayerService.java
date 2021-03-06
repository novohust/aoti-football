package org.hustsse.football.service;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.hustsse.football.dao.PlayerDao;
import org.hustsse.football.dao.TeamDao;
import org.hustsse.football.entity.Account;
import org.hustsse.football.entity.Player;
import org.hustsse.football.entity.Team;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class PlayerService {

	@Autowired
	PlayerDao playerDao;
	@Autowired
	TeamDao teamDao;

	@Transactional(readOnly = false)
	public void add(Player t) {
		playerDao.save(t);
	}

	public Player findById(Long id) {
		return playerDao.findUniqueBy("id", id);
	}

	//根据登录账户查找其个人（队员）信息
	public Player findPlayerinfoByAccount(Account account){
		List<Player> playerlist = playerDao.find("from Player p join fetch p.team  where p.account.id = ?",account.getId());

		if(playerlist.size() > 0)
		{
			return(Player) playerlist.get(0);
		}
		else
			return null;
	}

	public List<Player> findPlayersByTeamId(Long teamId){
		Criteria c = playerDao.createCriteria(Restrictions.eq("team.id", teamId));
		return playerDao.find(c);
	}
}