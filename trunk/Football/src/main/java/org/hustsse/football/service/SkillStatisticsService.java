package org.hustsse.football.service;

import org.hustsse.football.dao.SkillStatisticsDao;
import org.hustsse.football.entity.SkillStatistics;
import org.hustsse.football.entity.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly=true)
public class SkillStatisticsService {

	@Autowired
	SkillStatisticsDao skillStatisticsDao;

	@Transactional(readOnly = false)
	public void add(SkillStatistics t) {
		skillStatisticsDao.save(t);
	}

	public SkillStatistics findById(Long id) {
		return skillStatisticsDao.findUniqueBy("id", id);
	}

}
