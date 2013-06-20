package org.hustsse.football.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hustsse.football.dao.VideoDao;
import org.hustsse.football.entity.Video;
import org.hustsse.football.enums.PeriodEnum;
import org.hustsse.football.enums.VideoTypeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class VideoService {

	@Autowired
	VideoDao videoDao;

	@Transactional(readOnly = false)
	public void add(Video t) {
		videoDao.save(t);
	}

	public Video findById(Long id) {
		return videoDao.findUniqueBy("id", id);
	}

	public List<Video> findPlayerVideos(Long playerId,Date date,PeriodEnum period,VideoTypeEnum type) {
		return videoDao.find("from Video where player.id = ? and matchDate = ? and period = ? and videoType = ?", playerId,date,period,type);
	}

	public List<Video> findTeamVideos(Long teamId, Date date, PeriodEnum period, VideoTypeEnum type) {
		return videoDao.find("from Video v join fetch v.player p where p.team.id = ? and v.matchDate = ? and v.period = ? and v.videoType = ?", teamId,date,period,type);
	}
}