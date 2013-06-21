package org.hustsse.football.service;

import java.util.List;

import org.hustsse.football.dao.PlayerDao;
import org.hustsse.football.entity.Account;
import org.hustsse.football.entity.Coach;
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

	@Transactional(readOnly = false)
	public void add(Player t) {
		playerDao.save(t);
	}

	public Player findById(Long id) {
		return playerDao.findUniqueBy("id", id);
	}

	public Player findPlayerinfoByAccount(Account account){
		List<Player> playerlist = playerDao.find("from Player p where p.account.id = ?",account.getId());
		if(playerlist.size() > 0)
		{
			return (Player) playerlist.get(0);
		}
		else
			return null;
	}
}