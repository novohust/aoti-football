package org.hustsse.football.dao;

import org.hustsse.football.dao.base.HibernateDao;
import org.hustsse.football.entity.Account;
import org.hustsse.football.entity.Video;
import org.springframework.stereotype.Repository;

@Repository
public class VideoDao extends HibernateDao<Video, Long> {

}
