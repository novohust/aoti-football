package org.hustsse.football.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.hustsse.football.dao.SkillStatisticsDao;
import org.hustsse.football.entity.Player;
import org.hustsse.football.entity.SkillStatistics;
import org.hustsse.football.enums.PeriodEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly=true)
public class SkillStatisticsService {

	@Autowired
	SkillStatisticsDao skillStatisticsDao;
	@Autowired
	PlayerService playerService;

	@Transactional(readOnly = false)
	public void add(SkillStatistics t) {
		skillStatisticsDao.save(t);
	}

	public SkillStatistics findById(Long id) {
		return skillStatisticsDao.findUniqueBy("id", id);
	}

	public SkillStatistics findByPlayerAndDate(Long playerId, Date date, PeriodEnum period) {
		Criteria c = skillStatisticsDao.createCriteria(Restrictions.eq("player.id", playerId), Restrictions.eq("matchdate", date),
				Restrictions.eq("period", period));
		return skillStatisticsDao.findUnique(c);
	}

	//获取某个时间区间段内 队员的比赛信息（需要汇总）
	public  SkillStatistics findByPlayerAndDate(Long teamId,Long playerId, Date datefrom, PeriodEnum periodfrom, Date dateto,PeriodEnum periodto){
			Criteria c ;
			List<Long> playeridCollection = new ArrayList<Long>()  ;

			if( playerId == 0)//表示全球队
			{
				//找到所有的队员
				List<Player> playerlist = playerService.findPlayersByTeamId(teamId);
				Iterator<Player> it = playerlist.iterator();
				while(it.hasNext()){
					Long id = it.next().getId();
					playeridCollection.add(id);
				}
			}
			else{  //单个队员
				playeridCollection.add(playerId);
			}

			//查询时间区间内，并且playerid内的比赛信息 查出所有，而后再剔除
			c = skillStatisticsDao.createCriteria(Restrictions.in("player.id", playeridCollection), Restrictions.between("matchdate", datefrom, dateto));
			List<SkillStatistics> skillList = skillStatisticsDao.find(c);

			//区分上午下午
			if (periodfrom == PeriodEnum.Afternoon)//如果起始时间是下午，必须剔除上午的比赛数据
			{
				c = skillStatisticsDao.createCriteria(Restrictions.in("player.id", playeridCollection),Restrictions.eq("matchdate", datefrom),Restrictions.eq("period",PeriodEnum.Morning));//查出当天上午的比赛
				List<SkillStatistics> skilllistrmvS = skillStatisticsDao.find(c);
				skillList.removeAll(skilllistrmvS);
			}
			if(periodto == PeriodEnum.Morning)//如果截止时间是上午，必须剔除下午的比赛数据
			{
				c = skillStatisticsDao.createCriteria(Restrictions.in("player.id", playeridCollection),Restrictions.eq("matchdate", dateto),Restrictions.eq("period",PeriodEnum.Afternoon));//查出当天下午的比赛
				List<SkillStatistics> skilllistrmvX = skillStatisticsDao.find(c);
				skillList.removeAll(skilllistrmvX);
			}

			//需要汇总 skillList的字段并求平均值
			if( playerId == 0)//表示全球队
				{
				SkillStatistics skills = caculateAvrage(skillList);
				return skills;
		    }else
		    	return skillList.get(0);
	}

	//计算平均的比赛统计
	public  SkillStatistics caculateAvrage(List<SkillStatistics>skillList){

		if (skillList.size() == 0)
		return null;

		//抬头统计
		float showTime = 0;//出场时间
		int showTimes = 0;//出场次数
		int firstTimes = 0;//首发
		int backupTimes = 0;//替补

		//进攻数据 4*4
		int hitTimes = 0;//进球
		int assistTimes = 0;//助攻
		int shoot = 0;//射门
		int shotOT = 0;//射正
		int shotLong = 0;//远射
		int sightTac = 0;//抢点
		int breakSucc = 0;//突破成功
		float breakSuccRate = 0;//突破成功率
		int fouled = 0;//被犯规
		int mkpointSphere = 0;//创造本方点球机会
		int chpointSphere = 0;//主罚点球
		int succpointSphere = 0;//命中点球
		int crossTimes = 0;//传中次数
		int crossSucc = 0;//传中成功
		int passLane = 0;//传威胁球
		int offside = 0;//越位

		//防守数据 2*4
		int  stealSucc = 0;//抢断成功
		int  tackleTimes = 0;//铲球次数
		int  tackleSucc = 0;//铲球成功
		int  rescue = 0;//解围
		int  block = 0;//封堵射门
		int  foul = 0;//犯规
		int  yellowCard = 0;//黄牌
		int  redCard = 0;//红牌

		//技术数据 3*4 + 1*2
		int shortpass = 0;//短传
		int longpass = 0;//长传
		float passRate = 0;//传球成功率
		int slip = 0;//丢球
		int headbulb = 0;//头球次数
		int headSucc = 0;//头球成功
		int leftFree = 0;//主罚前场左路任意球
		int rightFree = 0;//主罚前场右路任意球
		int leftCorner = 0;//主罚左路角球
		int rightCorner = 0;//主罚右路角球
		int guardRunf = 0;//防守队员前插
		int guardRunb = 0;//进攻队员回防
		int obFailure = 0;//明显失误
		float PPGS = 0;//PPGS平均得分

		Iterator<SkillStatistics> it = skillList.iterator();
		SkillStatistics s = new SkillStatistics();
		while(it.hasNext()){
			s = it.next();

			  showTime += Float.parseFloat(s.getShowTime());//出场时间
			  showTimes += Integer.parseInt(s.getShowTimes());//出场次数
			  firstTimes += Integer.parseInt(s.getFirstTimes());//首发
			  backupTimes += Integer.parseInt(s.getBackupTimes());//替补

			//进攻数据 4*4
			  hitTimes += Integer.parseInt(s.getHitTimes());//进球
			  assistTimes += Integer.parseInt(s.getAssistTimes());//助攻
			  shoot += Integer.parseInt(s.getShoot());//射门
			  shotOT += Integer.parseInt(s.getShotOT());//射正
			  shotLong += Integer.parseInt(s.getShotLong());//远射
			  sightTac += Integer.parseInt(s.getSightTac());//抢点
			  breakSucc += Integer.parseInt(s.getBreakSucc());//突破成功
			  breakSuccRate += Float.parseFloat(s.getBreakSuccRate());//突破成功率
			  fouled += Integer.parseInt(s.getFouled());//被犯规
			  mkpointSphere += Integer.parseInt(s.getMkpointSphere());//创造本方点球机会
			  chpointSphere += Integer.parseInt(s.getChpointSphere());//主罚点球
			  succpointSphere += Integer.parseInt(s.getSuccpointSphere());//命中点球
			  crossTimes += Integer.parseInt(s.getCrossTimes());//传中次数
			  crossSucc += Integer.parseInt(s.getCrossSucc());//传中成功
			  passLane += Integer.parseInt(s.getPassLane());//传威胁球
			  offside += Integer.parseInt(s.getOffside());//越位

			//防守数据 2*4
			   stealSucc += Integer.parseInt(s.getStealSucc());//抢断成功
			   tackleTimes += Integer.parseInt(s.getTackleTimes());//铲球次数
			   tackleSucc += Integer.parseInt(s.getTackleSucc());//铲球成功
			   rescue += Integer.parseInt(s.getRescue());//解围
			   block += Integer.parseInt(s.getBlock());//封堵射门
			   foul += Integer.parseInt(s.getFoul());//犯规
			   yellowCard += Integer.parseInt(s.getYellowCard());//黄牌
			   redCard += Integer.parseInt(s.getRedCard());//红牌

			//技术数据 3*4 + 1*2
			  shortpass += Integer.parseInt(s.getShortpass());//短传
			  longpass +=Integer.parseInt(s.getLongpass());//长传
			   passRate += Float.parseFloat(s.getPassRate());//传球成功率
			  slip += Integer.parseInt(s.getSlip());//丢球
			  headbulb += Integer.parseInt(s.getHeadbulb());//头球次数
			  headSucc += Integer.parseInt(s.getHeadSucc());//头球成功
			  leftFree += Integer.parseInt(s.getLeftFree());//主罚前场左路任意球
			  rightFree += Integer.parseInt(s.getRightFree());//主罚前场右路任意球
			  leftCorner += Integer.parseInt(s.getLeftCorner());//主罚左路角球
			  rightCorner += Integer.parseInt(s.getRightCorner());//主罚右路角球
			  guardRunf += Integer.parseInt(s.getGuardRunf());//防守队员前插
			  guardRunb += Integer.parseInt(s.getGuardRunb());//进攻队员回防
			  obFailure += Integer.parseInt(s.getObFailure());//明显失误
			  PPGS += Float.parseFloat(s.getPPGS());//PPGS平均得分
		}

		//抬头
		s.setShowTime(String.valueOf(showTime));
		s.setShowTimes(String.valueOf(showTimes));
		s.setFirstTimes(String.valueOf(firstTimes));
		s.setBackupTimes(String.valueOf(backupTimes));
		//进攻数据 4*4
		s.setHitTimes(String.valueOf(hitTimes));
		s.setAssistTimes(String.valueOf(assistTimes));
		s.setShoot(String.valueOf(shoot));
		s.setShotOT(String.valueOf(shotOT));

		s.setShotLong(String.valueOf(shotLong));
		s.setSightTac(String.valueOf(sightTac));
		s.setBreakSucc(String.valueOf(breakSucc));
		s.setBreakSuccRate(String.valueOf(breakSuccRate));

		s.setFouled(String.valueOf(fouled));
		s.setMkpointSphere(String.valueOf(mkpointSphere));
		s.setChpointSphere(String.valueOf(chpointSphere));
		s.setSuccpointSphere(String.valueOf(succpointSphere));

		s.setCrossTimes(String.valueOf(crossTimes));
		s.setCrossSucc(String.valueOf(crossSucc));
		s.setPassLane(String.valueOf(passLane));
		s.setOffside(String.valueOf(offside));
		//防守数据 2*4
		s.setStealSucc(String.valueOf(stealSucc));
		s.setTackleTimes(String.valueOf(tackleTimes));
		s.setTackleSucc(String.valueOf(tackleSucc));
		s.setRescue(String.valueOf(rescue));

		s.setBlock(String.valueOf(block));
		s.setFoul(String.valueOf(foul));
		s.setYellowCard(String.valueOf(yellowCard));
		s.setRedCard(String.valueOf(redCard));
		//技术数据 3*4 + 1*2
		s.setShortpass(String.valueOf(shortpass));
		s.setLongpass(String.valueOf(longpass));
		s.setPassRate(String.valueOf(passRate));
		s.setSlip(String.valueOf(slip));

		s.setHeadbulb(String.valueOf(headbulb));
		s.setHeadSucc(String.valueOf(headSucc));
		s.setLeftFree(String.valueOf(leftFree));
		s.setRightFree(String.valueOf(rightFree));

		s.setLeftCorner(String.valueOf(leftCorner));
		s.setRightCorner(String.valueOf(rightCorner));
		s.setGuardRunf(String.valueOf(guardRunf));
		s.setGuardRunb(String.valueOf(guardRunb));

		s.setObFailure(String.valueOf(obFailure));
		s.setPPGS(String.valueOf(PPGS));
		return s;
	}



	@Transactional(readOnly = false)
	public void save(SkillStatistics t) {
		skillStatisticsDao.save(t);
	}
}
