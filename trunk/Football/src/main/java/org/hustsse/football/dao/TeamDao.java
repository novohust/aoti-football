package org.hustsse.football.dao;

import org.hustsse.football.dao.base.HibernateDao;
import org.hustsse.football.entity.Team;
import org.springframework.stereotype.Repository;

@Repository
public class TeamDao extends HibernateDao<Team, Long> {

}
