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
 * 技术统计
 * @author Anderson
 *
 */
@Entity
@Table
public class SkillStatistics extends IdEntity {

	//统计时间相关
	private Date date;//比赛时间
	private PeriodEnum period;//上午/下午

	//抬头统计
	private String showTime;//出场时间
	private String showTimes;//出场次数
	private String firstTimes;//首发
	private String backupTimes;//替补

	//进攻数据 4*4
	private String hitTimes;//进球
	private String assistTimes;//助攻
	private String shoot;//射门
	private String shotOT;//射正
	private String shotLong;//远射
	private String sightTac;//抢点
	private String breakSucc;//突破成功
	private String breakSuccRate;//突破成功率
	private String fouled;//被犯规
	private String mkpointSphere;//创造本方点球机会
	private String chpointSphere;//主罚点球
	private String succpointSphere;//命中点球
	private String crossTimes;//传中次数
	private String crossSucc;//传中成功
	private String passLane;//传威胁球
	private String offside;//越位

	//防守数据 2*4
	private String  stealSucc;//抢断成功
	private String  tackleTimes;//铲球次数
	private String  tackleSucc;//铲球成功
	private String  rescue;//解围
	private String  block;//封堵射门
	private String  foul;//犯规
	private String  yellowCard;//黄牌
	private String  redCard;//红牌

	//技术数据 3*4 + 1*2
	private String shortpass;//短传
	private String longpass;//长传
	private String passRate;//传球成功率
	private String slip;//丢球
	private String headbulb;//头球次数
	private String headSucc;//头球成功
	private String leftFree;//主罚前场左路任意球
	private String rightFree;//主罚前场右路任意球
	private String leftCorner;//主罚左路角球
	private String rightCorner;//主罚右路角球
	private String guardRunf;//防守队员前插
	private String guardRunb;//进攻队员回防
	private String obFailure;//明显失误
	private String PPGS;//PPGS平均得分

	//上传信息
	private Date uploadTime;//上传时间
	private String uploadName;//上传人


	private Player player;

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "player_id")
	public Player getPlayer() {
		return player;
	}

	public void setPlayer(Player player) {
		this.player = player;
	}

	public Date getMatchDate() {
		return date;
	}

	public void setMatchDate(Date matchDate) {
		this.date = matchDate;
	}

	public PeriodEnum getPeriod() {
		return period;
	}

	public void setPeriod(PeriodEnum period) {
		this.period = period;
	}

	public String getShowTime() {
		return showTime;
	}

	public void setShowTime(String showTime) {
		this.showTime = showTime;
	}

	public String getShowTimes() {
		return showTimes;
	}

	public void setShowTimes(String showTimes) {
		this.showTimes = showTimes;
	}

	public String getFirstTimes() {
		return firstTimes;
	}

	public void setFirstTimes(String firstTimes) {
		this.firstTimes = firstTimes;
	}

	public String getBackupTimes() {
		return backupTimes;
	}

	public void setBackupTimes(String backupTimes) {
		this.backupTimes = backupTimes;
	}

	public String getHitTimes() {
		return hitTimes;
	}

	public void setHitTimes(String hitTimes) {
		this.hitTimes = hitTimes;
	}

	public String getAssistTimes() {
		return assistTimes;
	}

	public void setAssistTimes(String assistTimes) {
		this.assistTimes = assistTimes;
	}

	public String getShoot() {
		return shoot;
	}

	public void setShoot(String shoot) {
		this.shoot = shoot;
	}

	public String getShotOT() {
		return shotOT;
	}

	public void setShotOT(String shotOT) {
		this.shotOT = shotOT;
	}

	public String getShotLong() {
		return shotLong;
	}

	public void setShotLong(String shotLong) {
		this.shotLong = shotLong;
	}

	public String getSightTac() {
		return sightTac;
	}

	public void setSightTac(String sightTac) {
		this.sightTac = sightTac;
	}

	public String getBreakSucc() {
		return breakSucc;
	}

	public void setBreakSucc(String breakSucc) {
		this.breakSucc = breakSucc;
	}

	public String getBreakSuccRate() {
		return breakSuccRate;
	}

	public void setBreakSuccRate(String breakSuccRate) {
		this.breakSuccRate = breakSuccRate;
	}

	public String getFouled() {
		return fouled;
	}

	public void setFouled(String fouled) {
		this.fouled = fouled;
	}

	public String getMkpointSphere() {
		return mkpointSphere;
	}

	public void setMkpointSphere(String mkpointSphere) {
		this.mkpointSphere = mkpointSphere;
	}

	public String getChpointSphere() {
		return chpointSphere;
	}

	public void setChpointSphere(String chpointSphere) {
		this.chpointSphere = chpointSphere;
	}

	public String getSuccpointSphere() {
		return succpointSphere;
	}

	public void setSuccpointSphere(String succpointSphere) {
		this.succpointSphere = succpointSphere;
	}

	public String getCrossTimes() {
		return crossTimes;
	}

	public void setCrossTimes(String crossTimes) {
		this.crossTimes = crossTimes;
	}

	public String getCrossSucc() {
		return crossSucc;
	}

	public void setCrossSucc(String crossSucc) {
		this.crossSucc = crossSucc;
	}

	public String getPassLane() {
		return passLane;
	}

	public void setPassLane(String passLane) {
		this.passLane = passLane;
	}

	public String getOffsied() {
		return offside;
	}

	public void setOffsied(String offsied) {
		this.offside = offsied;
	}

	public String getStealSucc() {
		return stealSucc;
	}

	public void setStealSucc(String stealSucc) {
		this.stealSucc = stealSucc;
	}

	public String getTackleTimes() {
		return tackleTimes;
	}

	public void setTackleTimes(String tackleTimes) {
		this.tackleTimes = tackleTimes;
	}

	public String getTackleSucc() {
		return tackleSucc;
	}

	public void setTackleSucc(String tackleSucc) {
		this.tackleSucc = tackleSucc;
	}

	public String getRescue() {
		return rescue;
	}

	public void setRescue(String rescue) {
		this.rescue = rescue;
	}

	public String getBlock() {
		return block;
	}

	public void setBlock(String block) {
		this.block = block;
	}

	public String getFoul() {
		return foul;
	}

	public void setFoul(String foul) {
		this.foul = foul;
	}

	public String getYellowCard() {
		return yellowCard;
	}

	public void setYellowCard(String yellowCard) {
		this.yellowCard = yellowCard;
	}

	public String getRedCard() {
		return redCard;
	}

	public void setRedCard(String redCard) {
		this.redCard = redCard;
	}

	public String getShortpass() {
		return shortpass;
	}

	public void setShortpass(String shortpass) {
		this.shortpass = shortpass;
	}

	public String getLongpass() {
		return longpass;
	}

	public void setLongpass(String longpass) {
		this.longpass = longpass;
	}

	public String getPassRate() {
		return passRate;
	}

	public void setPassRate(String passRate) {
		this.passRate = passRate;
	}

	public String getSlip() {
		return slip;
	}

	public void setSlip(String slip) {
		this.slip = slip;
	}

	public String getHeadbulb() {
		return headbulb;
	}

	public void setHeadbulb(String headbulb) {
		this.headbulb = headbulb;
	}

	public String getHeadSucc() {
		return headSucc;
	}

	public void setHeadSucc(String headSucc) {
		this.headSucc = headSucc;
	}

	public String getLeftFree() {
		return leftFree;
	}

	public void setLeftFree(String leftFree) {
		this.leftFree = leftFree;
	}

	public String getRightFree() {
		return rightFree;
	}

	public void setRightFree(String rightFree) {
		this.rightFree = rightFree;
	}

	public String getLeftCorner() {
		return leftCorner;
	}

	public void setLeftCorner(String leftCorner) {
		this.leftCorner = leftCorner;
	}

	public String getRightCorner() {
		return rightCorner;
	}

	public void setRightCorner(String rightCorner) {
		this.rightCorner = rightCorner;
	}

	public String getGuardRunf() {
		return guardRunf;
	}

	public void setGuardRunf(String guardRunf) {
		this.guardRunf = guardRunf;
	}

	public String getGuardRunb() {
		return guardRunb;
	}

	public void setGuardRunb(String guardRunb) {
		this.guardRunb = guardRunb;
	}

	public String getObFailure() {
		return obFailure;
	}

	public void setObFailure(String obFailure) {
		this.obFailure = obFailure;
	}

	public String getPPGS() {
		return PPGS;
	}

	public void setPPGS(String pPGS) {
		PPGS = pPGS;
	}

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
}
