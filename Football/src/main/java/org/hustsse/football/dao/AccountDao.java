package org.hustsse.football.dao;

import org.hustsse.football.dao.base.HibernateDao;
import org.hustsse.football.entity.Account;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDao extends HibernateDao<Account, Long> {

}
