package org.hustsse.football.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * 运动员
 *
 * @author Anderson
 *
 */
@Entity
@Table
public class Player extends IdEntity {

	private String name;
	private String password;

	private Team team;
	private Account account;
	private List<BodyInfo> bodyInfos;
	private List<Skills> skills;
	private List<SkillStatistics> skillStatistics;
	private List<DeviceInfo> deviceInfos;
	private List<Video> videos;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "account_id")
	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "team_id")
	public Team getTeam() {
		return team;
	}

	public void setTeam(Team team) {
		this.team = team;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "player", cascade = { CascadeType.REMOVE })
	public List<BodyInfo> getBodyInfos() {
		return bodyInfos;
	}

	public void setBodyInfos(List<BodyInfo> bodyInfos) {
		this.bodyInfos = bodyInfos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "player", cascade = { CascadeType.REMOVE })
	public List<Skills> getSkills() {
		return skills;
	}

	public void setSkills(List<Skills> skills) {
		this.skills = skills;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "player", cascade = { CascadeType.REMOVE })
	public List<SkillStatistics> getSkillStatistics() {
		return skillStatistics;
	}

	public void setSkillStatistics(List<SkillStatistics> skillStatistics) {
		this.skillStatistics = skillStatistics;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "player", cascade = { CascadeType.REMOVE })
	public List<DeviceInfo> getDeviceInfos() {
		return deviceInfos;
	}

	public void setDeviceInfos(List<DeviceInfo> deviceInfos) {
		this.deviceInfos = deviceInfos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "player", cascade = { CascadeType.REMOVE })
	public List<Video> getVideos() {
		return videos;
	}

	public void setVideos(List<Video> videos) {
		this.videos = videos;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
