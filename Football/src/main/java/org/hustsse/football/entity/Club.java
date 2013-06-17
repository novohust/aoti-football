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

	private String name;   //俱乐部名称
	private String flagpath;//俱乐部标志路径


	private List<Team> teams;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "club", cascade = { CascadeType.REMOVE })
	public List<Team> getTeams() {
		return teams;
	}

	public void setTeams(List<Team> teams) {
		this.teams = teams;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFlagpath() {
		return flagpath;
	}

	public void setFlagpath(String flagpath) {
		this.flagpath = flagpath;
	}



}
