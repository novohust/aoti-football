package org.hustsse.football.service;

import java.util.Date;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.hustsse.football.dao.MatchStatisticsDao;
import org.hustsse.football.entity.MatchStatistics;
import org.hustsse.football.entity.Skills;
import org.hustsse.football.enums.PeriodEnum;
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

	public MatchStatistics findByTeamAndDate(Long teamId, Date date, PeriodEnum period){
		Criteria c = matchStatisticsDao.createCriteria(Restrictions.eq("team.id", teamId),Restrictions.eq("matchdate", date),Restrictions.eq("period", period));
		return matchStatisticsDao.findUnique(c);

	}

	@Transactional(readOnly = false)
	public void save(MatchStatistics t) {
		matchStatisticsDao.save(t);
	}

}
