package org.hustsse.football.service;

import org.hustsse.football.dao.PlayerDao;
import org.hustsse.football.entity.Player;
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
}