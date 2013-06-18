package org.hustsse.football.service;

import org.hustsse.football.dao.MatchStatisticsDao;
import org.hustsse.football.entity.MatchStatistics;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly=true)
public class MatchStatisticsService {

	@Autowired
	MatchStatisticsDao matchStatisticsDao;

	@Transactional(readOnly = false)
	public void add(MatchStatistics t) {
		matchStatisticsDao.save(t);
	}

	public MatchStatistics findById(Long id) {
		return matchStatisticsDao.findUniqueBy("id", id);
	}

}
