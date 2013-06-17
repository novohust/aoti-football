package org.hustsse.football.service;

import org.hustsse.football.dao.CoachDao;
import org.hustsse.football.entity.Coach;
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
}