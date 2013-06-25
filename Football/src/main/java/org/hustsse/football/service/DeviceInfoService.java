package org.hustsse.football.service;

import java.util.Date;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.hustsse.football.dao.DeviceInfoDao;
import org.hustsse.football.dao.MonitorRecordDao;
import org.hustsse.football.entity.DeviceInfo;
import org.hustsse.football.entity.MonitorRecord;
import org.hustsse.football.enums.PeriodEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class DeviceInfoService {

	@Autowired
	DeviceInfoDao deviceInfoDao;
	@Autowired
	MonitorRecordDao monitorRecordDao;

	@Transactional(readOnly = false)
	public void add(DeviceInfo t) {
		deviceInfoDao.save(t);
	}

	public DeviceInfo findById(Long id) {
		return deviceInfoDao.findUniqueBy("id", id);
	}

	public DeviceInfo findByPlayerAndDate(Long playerId, Date date, PeriodEnum period) {
		Criteria c = deviceInfoDao.createCriteria(Restrictions.eq("player.id", playerId), Restrictions.eq("date", date),
				Restrictions.eq("period", period));
		DeviceInfo i = deviceInfoDao.findUnique(c);
		if(i != null && i.getRecords() != null)
			deviceInfoDao.initProxyObject(i.getRecords());
		return i;
	}

	@Transactional(readOnly = false)
	public void save(DeviceInfo t) {
		deviceInfoDao.save(t);
	}

	@Transactional(readOnly = false)
	public void importMonitorRecords(DeviceInfo t) {
		deviceInfoDao.save(t);
		for (MonitorRecord r : t.getRecords()) {
			r.setDeviceInfo(t);
			monitorRecordDao.save(r);
		}
	}
}