package org.hustsse.football.service;

import org.hustsse.football.dao.SkillsDao;
import org.hustsse.football.entity.Skills;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class SkillsService {

	@Autowired
	SkillsDao skillsDao;

	@Transactional(readOnly = false)
	public void add(Skills t) {
		skillsDao.save(t);
	}

	public Skills findById(Long id) {
		return skillsDao.findUniqueBy("id", id);
	}
}