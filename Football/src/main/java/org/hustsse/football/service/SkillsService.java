package org.hustsse.football.service;

import java.util.Date;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.hustsse.football.dao.SkillsDao;
import org.hustsse.football.entity.Skills;
import org.hustsse.football.enums.PeriodEnum;
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

	public Skills findByPlayerAndDate(Long playerId, Date date, PeriodEnum period) {
		Criteria c = skillsDao.createCriteria(Restrictions.eq("player.id", playerId), Restrictions.eq("date", date),
				Restrictions.eq("period", period));
		return skillsDao.findUnique(c);
	}

	@Transactional(readOnly = false)
	public void save(Skills t) {
		skillsDao.save(t);
	}
}