package org.hustsse.football.service;

import org.hustsse.football.dao.VideoDao;
import org.hustsse.football.entity.Video;
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
}