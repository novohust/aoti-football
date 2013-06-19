package org.hustsse.football.service;

import java.util.Date;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.hustsse.football.dao.BodyInfoDao;
import org.hustsse.football.entity.BodyInfo;
import org.hustsse.football.enums.PeriodEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class BodyInfoService {

	@Autowired
	BodyInfoDao bodyInfoDao;

	@Transactional(readOnly = false)
	public void add(BodyInfo t) {
		bodyInfoDao.save(t);
	}

	public BodyInfo findById(Long id) {
		return bodyInfoDao.findUniqueBy("id", id);
	}

	public BodyInfo findByPlayerAndDate(Long playerId, Date date, PeriodEnum period) {
		Criteria c = bodyInfoDao.createCriteria(Restrictions.eq("player.id", playerId), Restrictions.eq("date", date),
				Restrictions.eq("period", period));
		return bodyInfoDao.findUnique(c);
	}

	@Transactional(readOnly = false)
	public void save(BodyInfo t) {
		bodyInfoDao.save(t);
	}
}