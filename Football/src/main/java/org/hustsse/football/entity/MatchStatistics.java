package org.hustsse.football.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hustsse.football.enums.PeriodEnum;

/**
 * 比赛统计
 * @author Anderson
 *
 */
@Entity
@Table
public class MatchStatistics extends IdEntity {

	//统计时间相关
	private Date date;//比赛时间

	private PeriodEnum period;//上午/下午

	//比赛信息
	 private String matchName;//比赛名称
	 private String teamCompete;//对方队名

	 //统计洗洗脑 1*17
	 private String totalShot;//总射门
	 private String shotTarget;// 射正球门
	 private String shotOut;//射门偏出
	 private String shotGate;//击中门框
	 private String throughBall;//直塞球
	 private String offsied;//越位
	 private String steal;//抢断
	 private String free;//任意球
	 private String foul;//犯规
	 private String corner;//角球
	 private String outBound;//界外球
	 private String longPass;//超过25码长传
	 private String passSuccRate;//传球成功率
	 private String crossRate;//传中成功率
	 private String stealRate;//抢断成功率
	 private String headRate;//头球成功率
	 private String ctrlRate; //控球率

		//上传信息
     private Date uploadTime;//上传时间
     private String uploadName;//上传人


	public Date getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	public String getUploadName() {
		return uploadName;
	}

	public void setUploadName(String uploadName) {
		this.uploadName = uploadName;
	}



	public PeriodEnum getPeriod() {
		return period;
	}

	public void setPeriod(PeriodEnum period) {
		this.period = period;
	}

	public String getMatchName() {
		return matchName;
	}

	public void setMatchName(String matchName) {
		this.matchName = matchName;
	}

	public String getTeamCompete() {
		return teamCompete;
	}

	public void setTeamCompete(String teamCompete) {
		this.teamCompete = teamCompete;
	}

	public String getTotalShot() {
		return totalShot;
	}

	public void setTotalShot(String totalShot) {
		this.totalShot = totalShot;
	}

	public String getShotTarget() {
		return shotTarget;
	}

	public void setShotTarget(String shotTarget) {
		this.shotTarget = shotTarget;
	}

	public String getShotOut() {
		return shotOut;
	}

	public void setShotOut(String shotOut) {
		this.shotOut = shotOut;
	}

	public String getShotGate() {
		return shotGate;
	}

	public void setShotGate(String shotGate) {
		this.shotGate = shotGate;
	}

	public String getThroughBall() {
		return throughBall;
	}

	public void setThroughBall(String throughBall) {
		this.throughBall = throughBall;
	}

	public String getOffsied() {
		return offsied;
	}

	public void setOffsied(String offsied) {
		this.offsied = offsied;
	}

	public String getSteal() {
		return steal;
	}

	public void setSteal(String steal) {
		this.steal = steal;
	}

	public String getFree() {
		return free;
	}

	public void setFree(String free) {
		this.free = free;
	}

	public String getFoul() {
		return foul;
	}

	public void setFoul(String foul) {
		this.foul = foul;
	}

	public String getCorner() {
		return corner;
	}

	public void setCorner(String corner) {
		this.corner = corner;
	}

	public String getOutBound() {
		return outBound;
	}

	public void setOutBound(String outBound) {
		this.outBound = outBound;
	}

	public String getLongPass() {
		return longPass;
	}

	public void setLongPass(String longPass) {
		this.longPass = longPass;
	}

	public String getPassSuccRate() {
		return passSuccRate;
	}

	public void setPassSuccRate(String passSuccRate) {
		this.passSuccRate = passSuccRate;
	}

	public String getCrossRate() {
		return crossRate;
	}

	public void setCrossRate(String crossRate) {
		this.crossRate = crossRate;
	}

	public String getStealRate() {
		return stealRate;
	}

	public void setStealRate(String stealRate) {
		this.stealRate = stealRate;
	}

	public String getHeadRate() {
		return headRate;
	}

	public void setHeadRate(String headRate) {
		this.headRate = headRate;
	}

	public String getCtrlRate() {
		return ctrlRate;
	}

	public void setCtrlRate(String ctrlRate) {
		this.ctrlRate = ctrlRate;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	private Team team;

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "team_id")
	public Team getTeam() {
		return team;
	}

	public void setTeam(Team team) {
		this.team = team;
	}



}
