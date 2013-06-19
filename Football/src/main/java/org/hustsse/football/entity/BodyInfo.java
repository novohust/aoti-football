package org.hustsse.football.entity;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.commons.lang3.StringUtils;
import org.hustsse.football.enums.PeriodEnum;

/**
 * 体能
 *
 * @author Anderson
 *
 */
@Entity
@Table
public class BodyInfo extends IdEntity {
	private Date date;
	private PeriodEnum period;

	// ------ excel
	private String totalDistance; // 总距离
	private String totalDistanceF; // 上半场
	private String totalDistanceS; // 下半场

	private String standDistance; // 站立距离
	private String standDistanceF; // 上半场
	private String standDistanceS; // 下半场

	private String walkDistance; // 步行距离
	private String walkDistanceF; // 上半场
	private String walkDistanceS; // 下半场

	private String slowRunDistance; // 慢跑距离
	private String slowRunDistanceF; // 上半场
	private String slowRunDistanceS; // 下半场

	private String runDistanceAndTimes; // 奔跑距离/次数
	private String runDistanceAndTimesF; // 上半场
	private String runDistanceAndTimesS; // 下半场

	private String highSpeedRunDistanceAndTimes; // 高速奔跑距离/次数
	private String highSpeedRunDistanceAndTimesF; // 上半场
	private String highSpeedRunDistanceAndTimesS; // 下半场

	private String spurtDistanceAndTimes; // 冲刺距离/次数
	private String spurtDistanceAndTimesF; // 上半场
	private String spurtDistanceAndTimesS; // 下半场

	private String passTimes; // 传球/准确次数
	private String battleTimes; // 对决/成功次数
	private String inTime; // 上场时间
	private String avgSpeed; // 平均速度

	// ------ img path
	private String moveImgF; // 运动，上半场
	private String moveImgS; // 运动，下半场

	private String spurtImgF; // 高速运动和冲刺，上半场
	private String spurtImgS; // 高速运动和冲刺，下半场

	private Player player;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "player_id")
	public Player getPlayer() {
		return player;
	}

	public void setPlayer(Player player) {
		this.player = player;
	}

	public String getTotalDistance() {
		return totalDistance;
	}

	public void setTotalDistance(String totalDistance) {
		this.totalDistance = totalDistance;
	}

	public String getTotalDistanceF() {
		return totalDistanceF;
	}

	public void setTotalDistanceF(String totalDistanceF) {
		this.totalDistanceF = totalDistanceF;
	}

	public String getTotalDistanceS() {
		return totalDistanceS;
	}

	public void setTotalDistanceS(String totalDistanceS) {
		this.totalDistanceS = totalDistanceS;
	}

	public String getStandDistance() {
		return standDistance;
	}

	public void setStandDistance(String standDistance) {
		this.standDistance = standDistance;
	}

	public String getStandDistanceF() {
		return standDistanceF;
	}

	public void setStandDistanceF(String standDistanceF) {
		this.standDistanceF = standDistanceF;
	}

	public String getStandDistanceS() {
		return standDistanceS;
	}

	public void setStandDistanceS(String standDistanceS) {
		this.standDistanceS = standDistanceS;
	}

	public String getWalkDistance() {
		return walkDistance;
	}

	public void setWalkDistance(String walkDistance) {
		this.walkDistance = walkDistance;
	}

	public String getWalkDistanceF() {
		return walkDistanceF;
	}

	public void setWalkDistanceF(String walkDistanceF) {
		this.walkDistanceF = walkDistanceF;
	}

	public String getWalkDistanceS() {
		return walkDistanceS;
	}

	public void setWalkDistanceS(String walkDistanceS) {
		this.walkDistanceS = walkDistanceS;
	}

	public String getSlowRunDistance() {
		return slowRunDistance;
	}

	public void setSlowRunDistance(String slowRunDistance) {
		this.slowRunDistance = slowRunDistance;
	}

	public String getSlowRunDistanceF() {
		return slowRunDistanceF;
	}

	public void setSlowRunDistanceF(String slowRunDistanceF) {
		this.slowRunDistanceF = slowRunDistanceF;
	}

	public String getSlowRunDistanceS() {
		return slowRunDistanceS;
	}

	public void setSlowRunDistanceS(String slowRunDistanceS) {
		this.slowRunDistanceS = slowRunDistanceS;
	}

	public String getRunDistanceAndTimes() {
		return runDistanceAndTimes;
	}

	public void setRunDistanceAndTimes(String runDistanceAndTimes) {
		this.runDistanceAndTimes = runDistanceAndTimes;
	}

	public String getRunDistanceAndTimesF() {
		return runDistanceAndTimesF;
	}

	public void setRunDistanceAndTimesF(String runDistanceAndTimesF) {
		this.runDistanceAndTimesF = runDistanceAndTimesF;
	}

	public String getRunDistanceAndTimesS() {
		return runDistanceAndTimesS;
	}

	public void setRunDistanceAndTimesS(String runDistanceAndTimesS) {
		this.runDistanceAndTimesS = runDistanceAndTimesS;
	}

	public String getHighSpeedRunDistanceAndTimes() {
		return highSpeedRunDistanceAndTimes;
	}

	public void setHighSpeedRunDistanceAndTimes(String highSpeedRunDistanceAndTimes) {
		this.highSpeedRunDistanceAndTimes = highSpeedRunDistanceAndTimes;
	}

	public String getHighSpeedRunDistanceAndTimesF() {
		return highSpeedRunDistanceAndTimesF;
	}

	public void setHighSpeedRunDistanceAndTimesF(String highSpeedRunDistanceAndTimesF) {
		this.highSpeedRunDistanceAndTimesF = highSpeedRunDistanceAndTimesF;
	}

	public String getHighSpeedRunDistanceAndTimesS() {
		return highSpeedRunDistanceAndTimesS;
	}

	public void setHighSpeedRunDistanceAndTimesS(String highSpeedRunDistanceAndTimesS) {
		this.highSpeedRunDistanceAndTimesS = highSpeedRunDistanceAndTimesS;
	}

	public String getSpurtDistanceAndTimes() {
		return spurtDistanceAndTimes;
	}

	public void setSpurtDistanceAndTimes(String spurtDistanceAndTimes) {
		this.spurtDistanceAndTimes = spurtDistanceAndTimes;
	}

	public String getSpurtDistanceAndTimesF() {
		return spurtDistanceAndTimesF;
	}

	public void setSpurtDistanceAndTimesF(String spurtDistanceAndTimesF) {
		this.spurtDistanceAndTimesF = spurtDistanceAndTimesF;
	}

	public String getSpurtDistanceAndTimesS() {
		return spurtDistanceAndTimesS;
	}

	public void setSpurtDistanceAndTimesS(String spurtDistanceAndTimesS) {
		this.spurtDistanceAndTimesS = spurtDistanceAndTimesS;
	}

	public String getPassTimes() {
		return passTimes;
	}

	public void setPassTimes(String passTimes) {
		this.passTimes = passTimes;
	}

	public String getBattleTimes() {
		return battleTimes;
	}

	public void setBattleTimes(String battleTimes) {
		this.battleTimes = battleTimes;
	}

	public String getInTime() {
		return inTime;
	}

	public void setInTime(String inTime) {
		this.inTime = inTime;
	}

	public String getAvgSpeed() {
		return avgSpeed;
	}

	public void setAvgSpeed(String avgSpeed) {
		this.avgSpeed = avgSpeed;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Enumerated(EnumType.STRING)
	public PeriodEnum getPeriod() {
		return period;
	}

	public void setPeriod(PeriodEnum period) {
		this.period = period;
	}

	public String getMoveImgF() {
		return moveImgF;
	}

	public void setMoveImgF(String moveImgF) {
		this.moveImgF = moveImgF;
	}

	public String getMoveImgS() {
		return moveImgS;
	}

	public void setMoveImgS(String moveImgS) {
		this.moveImgS = moveImgS;
	}

	public String getSpurtImgF() {
		return spurtImgF;
	}

	public void setSpurtImgF(String spurtImgF) {
		this.spurtImgF = spurtImgF;
	}

	public String getSpurtImgS() {
		return spurtImgS;
	}

	public void setSpurtImgS(String spurtImgS) {
		this.spurtImgS = spurtImgS;
	}

}
