package org.hustsse.football.dao;

import org.hustsse.football.dao.base.HibernateDao;
import org.hustsse.football.entity.Player;
import org.springframework.stereotype.Repository;

@Repository
public class PlayerDao extends HibernateDao<Player, Long> {

}
