package org.hustsse.football.dao;

import org.hustsse.football.dao.base.HibernateDao;
import org.hustsse.football.entity.DeviceInfo;
import org.hustsse.football.entity.MonitorRecord;
import org.springframework.stereotype.Repository;

@Repository
public class MonitorRecordDao extends HibernateDao<MonitorRecord, Long> {

}
