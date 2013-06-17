package org.hustsse.football.dao;

import org.hustsse.football.dao.base.HibernateDao;
import org.hustsse.football.entity.Coach;
import org.springframework.stereotype.Repository;

@Repository
public class CoachDao extends HibernateDao<Coach, Long> {

}
