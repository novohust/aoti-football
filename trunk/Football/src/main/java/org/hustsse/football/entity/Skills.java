package org.hustsse.football.entity;

import java.lang.reflect.Field;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hustsse.football.enums.PeriodEnum;

/**
 * 技战术
 * @author Anderson
 *
 */
@Entity
@Table
public class Skills extends IdEntity {
	private Date date;
	private PeriodEnum period;

	//------ excel 动作
	private String goalAndAssist;	//进球/助攻
	private String shoot;//射门/中目标
	private String foul;//犯规/收到犯规
	private String card;//黄/红牌
	private String offside;//越位
	private String moveTimes;//动作次数/成功次数
	private String moveSuccessRate;//动作成功率
	private String defence;//防守动作/成功
	private String attack;//仅供动作/成功
	private String moveInOwnSide;//在己方三分之一球场的动作次数
	private String moveInMiddleArea;//在中场的动作次数
	private String moveInOtherSide;//在对方三分之一球场的动作次数

	//------ excel 拼抢
	private String battle;	//对决/成功次数
	private String striveWinRate;//赢得拼抢
	private String defenceStrive;//防守拼抢/成功
	private String attackStrive;//进攻拼抢/成功
	private String groudStrive;//地面拼抢/成功
	private String airStrive;//空中拼抢/成功
	private String dribble;//运球/成功次数
	private String tackle;//铲球/成功
	private String getBall;//非受迫状况下得球/在对方半场
	private String interception;//拦截/在对方半场
	private String badBallControl;//不好的控球
	private String regetBall;///重夺控球次数/在对方半场
	private String loseBall;//失球次数/在己方半场

	//------ excel 传球
	private String pass;	//传球/准确次数
	private String passRate;	//传球成功率
	private String normalPass;	//非进攻性传球/准确次数
	private String attackPass;	//进攻性传球/准确次数
	private String threatenPass;	//威胁性传球/准确次数
	private String keyPass;	//关键传球/准确次数
	private String shortPass;	//短传/准确次数
	private String middleDistancePass;	//中距离传球/准确次数
	private String longPass;	//长传/准确次数
	private String passIntoPenalty;	//进入禁区/准确
	private String passReceived;	//接球数
	private String vovledInAttack;	//参与进攻
	private String positionalAttack;	//阵地进攻
	private String counterattack ;	//反击
	private String setPieceAttack ;	//定位球进攻

	//------ 图片
	private String moveImg;//比赛中的动作
	private String moveRateImg;//比赛中动作成功率
	private String movePlaceImg;//所有动作的地点
	private String striveImg;//比赛中拼抢
	private String striveRateImg;//比赛中赢得拼抢
	private String strivePlaceImg;//所有拼抢的地点
	private String loseBallImg;//在区域中失球
	private String regetBallImg;//在区域中重夺控球
	private String passFImg;//传球-上半场
	private String passSImg;//传球-下半场
	private String passRouteImg;//传球路线


	private Player player;

	public static void main(String[] args) {
		Field[] fields = Skills.class.getDeclaredFields();
		for (Field field : fields) {// --for() begin
			System.out.println("<input type='hidden' name='attr' value='"+field.getName()+"'/>");
		}
	}

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "player_id")
	public Player getPlayer() {
		return player;
	}

	public void setPlayer(Player player) {
		this.player = player;
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

	public String getGoalAndAssist() {
		return goalAndAssist;
	}

	public void setGoalAndAssist(String goalAndAssist) {
		this.goalAndAssist = goalAndAssist;
	}

	public String getShoot() {
		return shoot;
	}

	public void setShoot(String shoot) {
		this.shoot = shoot;
	}

	public String getFoul() {
		return foul;
	}

	public void setFoul(String foul) {
		this.foul = foul;
	}

	public String getCard() {
		return card;
	}

	public void setCard(String card) {
		this.card = card;
	}

	public String getOffside() {
		return offside;
	}

	public void setOffside(String offside) {
		this.offside = offside;
	}

	public String getMoveTimes() {
		return moveTimes;
	}

	public void setMoveTimes(String moveTimes) {
		this.moveTimes = moveTimes;
	}

	public String getMoveSuccessRate() {
		return moveSuccessRate;
	}

	public void setMoveSuccessRate(String moveSuccessRate) {
		this.moveSuccessRate = moveSuccessRate;
	}

	public String getDefence() {
		return defence;
	}

	public void setDefence(String defence) {
		this.defence = defence;
	}

	public String getAttack() {
		return attack;
	}

	public void setAttack(String attack) {
		this.attack = attack;
	}

	public String getMoveInOwnSide() {
		return moveInOwnSide;
	}

	public void setMoveInOwnSide(String moveInOwnSide) {
		this.moveInOwnSide = moveInOwnSide;
	}

	public String getMoveInMiddleArea() {
		return moveInMiddleArea;
	}

	public void setMoveInMiddleArea(String moveInMiddleArea) {
		this.moveInMiddleArea = moveInMiddleArea;
	}

	public String getMoveInOtherSide() {
		return moveInOtherSide;
	}

	public void setMoveInOtherSide(String moveInOtherSide) {
		this.moveInOtherSide = moveInOtherSide;
	}

	public String getBattle() {
		return battle;
	}

	public void setBattle(String battle) {
		this.battle = battle;
	}

	public String getStriveWinRate() {
		return striveWinRate;
	}

	public void setStriveWinRate(String striveWinRate) {
		this.striveWinRate = striveWinRate;
	}

	public String getDefenceStrive() {
		return defenceStrive;
	}

	public void setDefenceStrive(String defenceStrive) {
		this.defenceStrive = defenceStrive;
	}

	public String getAttackStrive() {
		return attackStrive;
	}

	public void setAttackStrive(String attackStrive) {
		this.attackStrive = attackStrive;
	}

	public String getGroudStrive() {
		return groudStrive;
	}

	public void setGroudStrive(String groudStrive) {
		this.groudStrive = groudStrive;
	}

	public String getAirStrive() {
		return airStrive;
	}

	public void setAirStrive(String airStrive) {
		this.airStrive = airStrive;
	}

	public String getDribble() {
		return dribble;
	}

	public void setDribble(String dribble) {
		this.dribble = dribble;
	}

	public String getTackle() {
		return tackle;
	}

	public void setTackle(String tackle) {
		this.tackle = tackle;
	}

	public String getGetBall() {
		return getBall;
	}

	public void setGetBall(String getBall) {
		this.getBall = getBall;
	}

	public String getInterception() {
		return interception;
	}

	public void setInterception(String interception) {
		this.interception = interception;
	}

	public String getBadBallControl() {
		return badBallControl;
	}

	public void setBadBallControl(String badBallControl) {
		this.badBallControl = badBallControl;
	}

	public String getRegetBall() {
		return regetBall;
	}

	public void setRegetBall(String regetBall) {
		this.regetBall = regetBall;
	}

	public String getLoseBall() {
		return loseBall;
	}

	public void setLoseBall(String loseBall) {
		this.loseBall = loseBall;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getPassRate() {
		return passRate;
	}

	public void setPassRate(String passRate) {
		this.passRate = passRate;
	}

	public String getNormalPass() {
		return normalPass;
	}

	public void setNormalPass(String normalPass) {
		this.normalPass = normalPass;
	}

	public String getAttackPass() {
		return attackPass;
	}

	public void setAttackPass(String attackPass) {
		this.attackPass = attackPass;
	}

	public String getThreatenPass() {
		return threatenPass;
	}

	public void setThreatenPass(String threatenPass) {
		this.threatenPass = threatenPass;
	}

	public String getKeyPass() {
		return keyPass;
	}

	public void setKeyPass(String keyPass) {
		this.keyPass = keyPass;
	}

	public String getShortPass() {
		return shortPass;
	}

	public void setShortPass(String shortPass) {
		this.shortPass = shortPass;
	}

	public String getMiddleDistancePass() {
		return middleDistancePass;
	}

	public void setMiddleDistancePass(String middleDistancePass) {
		this.middleDistancePass = middleDistancePass;
	}

	public String getLongPass() {
		return longPass;
	}

	public void setLongPass(String longPass) {
		this.longPass = longPass;
	}

	public String getPassIntoPenalty() {
		return passIntoPenalty;
	}

	public void setPassIntoPenalty(String passIntoPenalty) {
		this.passIntoPenalty = passIntoPenalty;
	}

	public String getPassReceived() {
		return passReceived;
	}

	public void setPassReceived(String passReceived) {
		this.passReceived = passReceived;
	}

	public String getVovledInAttack() {
		return vovledInAttack;
	}

	public void setVovledInAttack(String vovledInAttack) {
		this.vovledInAttack = vovledInAttack;
	}

	public String getPositionalAttack() {
		return positionalAttack;
	}

	public void setPositionalAttack(String positionalAttack) {
		this.positionalAttack = positionalAttack;
	}

	public String getCounterattack() {
		return counterattack;
	}

	public void setCounterattack(String counterattack) {
		this.counterattack = counterattack;
	}

	public String getSetPieceAttack() {
		return setPieceAttack;
	}

	public void setSetPieceAttack(String setPieceAttack) {
		this.setPieceAttack = setPieceAttack;
	}

	public String getMoveImg() {
		return moveImg;
	}

	public void setMoveImg(String moveImg) {
		this.moveImg = moveImg;
	}

	public String getMoveRateImg() {
		return moveRateImg;
	}

	public void setMoveRateImg(String moveRateImg) {
		this.moveRateImg = moveRateImg;
	}

	public String getMovePlaceImg() {
		return movePlaceImg;
	}

	public void setMovePlaceImg(String movePlaceImg) {
		this.movePlaceImg = movePlaceImg;
	}

	public String getStriveImg() {
		return striveImg;
	}

	public void setStriveImg(String striveImg) {
		this.striveImg = striveImg;
	}

	public String getStriveRateImg() {
		return striveRateImg;
	}

	public void setStriveRateImg(String striveRateImg) {
		this.striveRateImg = striveRateImg;
	}

	public String getStrivePlaceImg() {
		return strivePlaceImg;
	}

	public void setStrivePlaceImg(String strivePlaceImg) {
		this.strivePlaceImg = strivePlaceImg;
	}

	public String getLoseBallImg() {
		return loseBallImg;
	}

	public void setLoseBallImg(String loseBallImg) {
		this.loseBallImg = loseBallImg;
	}

	public String getRegetBallImg() {
		return regetBallImg;
	}

	public void setRegetBallImg(String regetBallImg) {
		this.regetBallImg = regetBallImg;
	}

	public String getPassFImg() {
		return passFImg;
	}

	public void setPassFImg(String passFImg) {
		this.passFImg = passFImg;
	}

	public String getPassSImg() {
		return passSImg;
	}

	public void setPassSImg(String passSImg) {
		this.passSImg = passSImg;
	}

	public String getPassRouteImg() {
		return passRouteImg;
	}

	public void setPassRouteImg(String passRouteImg) {
		this.passRouteImg = passRouteImg;
	}


}
