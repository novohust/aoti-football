package org.hustsse.football.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hustsse.football.enums.GenderEnum;

/**
 * 球队
 *
 * @author Anderson
 *
 */
@Entity
@Table
public class Team extends IdEntity {

	private String name;   //队名
	private String flagpath;//队旗路径
	private GenderEnum gender;	// 男队女队


	private Club club;
	private List<Coach> coachs;
	private List<Player> players;
	private List<MatchStatistics> matchStatistics;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "team", cascade = { CascadeType.REMOVE })
	public List<Coach> getCoachs() {
		return coachs;
	}

	public void setCoachs(List<Coach> coachs) {
		this.coachs = coachs;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "team", cascade = { CascadeType.REMOVE })
	public List<Player> getPlayers() {
		return players;
	}

	public void setPlayers(List<Player> players) {
		this.players = players;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "club_id")
	public Club getClub() {
		return club;
	}

	public void setClub(Club club) {
		this.club = club;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "team", cascade = { CascadeType.REMOVE })
	public List<MatchStatistics> getMatchStatistics() {
		return matchStatistics;
	}

	public void setMatchStatistics(List<MatchStatistics> matchStatistics) {
		this.matchStatistics = matchStatistics;
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

	@Enumerated(EnumType.STRING)
	public GenderEnum getGender() {
		return gender;
	}

	public void setGender(GenderEnum gender) {
		this.gender = gender;
	}



}
