package org.hustsse.football.service;

import java.util.List;

import org.hustsse.football.dao.ClubDao;
import org.hustsse.football.entity.Club;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class ClubService {

	@Autowired
	ClubDao clubDao;

	@Transactional(readOnly = false)
	public void add(Club t) {
		clubDao.save(t);
	}

	public Club findById(Long id) {
		return clubDao.findUniqueBy("id", id);
	}

	public List<Club> findAllClub(){
		return clubDao.getAll();
	}
}