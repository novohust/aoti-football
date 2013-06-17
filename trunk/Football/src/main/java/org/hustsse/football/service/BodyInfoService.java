package org.hustsse.football.service;

import org.hustsse.football.dao.BodyInfoDao;
import org.hustsse.football.entity.BodyInfo;
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
}