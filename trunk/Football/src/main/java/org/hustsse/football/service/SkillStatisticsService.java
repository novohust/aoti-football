package org.hustsse.football.service;

import java.util.Date;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.hustsse.football.dao.SkillStatisticsDao;
import org.hustsse.football.entity.BodyInfo;
import org.hustsse.football.entity.MatchStatistics;
import org.hustsse.football.entity.SkillStatistics;
import org.hustsse.football.entity.Video;
import org.hustsse.football.enums.PeriodEnum;
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

	public SkillStatistics findByPlayerAndDate(Long playerId, Date date, PeriodEnum period) {
		Criteria c = skillStatisticsDao.createCriteria(Restrictions.eq("player.id", playerId), Restrictions.eq("matchdate", date),
				Restrictions.eq("period", period));
		return skillStatisticsDao.findUnique(c);
	}

	//获取某个时间区间段内 队员的比赛信息（需要汇总）
	public  SkillStatistics findByPlayerAndDate(Long teamId,Long playerId, Date datefrom, PeriodEnum periodfrom, Date dateto,PeriodEnum periodto){
		Criteria c ;
		if( playerId == 0)//表示全球队
		{
			//需要修改 ，汇总
			c = skillStatisticsDao.createCriteria(Restrictions.eq("player.id", playerId), Restrictions.eq("matchdate", datefrom),
					Restrictions.eq("period", periodfrom));
		}else{
			 c = skillStatisticsDao.createCriteria(Restrictions.eq("player.id", playerId), Restrictions.eq("matchdate", datefrom),
				Restrictions.eq("period", periodfrom));
			}
		return skillStatisticsDao.findUnique(c);
	}

	@Transactional(readOnly = false)
	public void save(SkillStatistics t) {
		skillStatisticsDao.save(t);
	}
}
