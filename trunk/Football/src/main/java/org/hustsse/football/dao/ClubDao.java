package org.hustsse.football.dao;

import org.hustsse.football.dao.base.HibernateDao;
import org.hustsse.football.entity.Club;
import org.springframework.stereotype.Repository;

@Repository
public class ClubDao extends HibernateDao<Club, Long> {

}
