package org.hustsse.football.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 俱乐部
 * @author Anderson
 *
 */
@Entity
@Table
public class Club extends IdEntity {

	private List<Team> teams;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "club", cascade = { CascadeType.REMOVE })
	public List<Team> getTeams() {
		return teams;
	}

	public void setTeams(List<Team> teams) {
		this.teams = teams;
	}


}
