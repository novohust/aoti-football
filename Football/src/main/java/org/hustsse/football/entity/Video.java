package org.hustsse.football.entity;

import java.util.Date;
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

import org.hustsse.football.enums.PeriodEnum;
import org.hustsse.football.enums.VideoTypeEnum;

/**
 * 视频
 *
 * @author Anderson
 *
 */
@Entity
@Table
public class Video extends IdEntity {

	// 统计时间相关
	private Date matchDate;// 比赛时间

	// 视频信息
	private String videoPath;// 视频路径
	private VideoTypeEnum videoType;// 视频类型（射门，头球，点球etc）
	private String videoDesc;// 视频描述
	private String name;// 视频名称（文件名，没有后缀名）

	// 上传信息
	private Date uploadTime;// 上传时间
	private String uploadName;// 上传人

	public Date getMatchDate() {
		return matchDate;
	}

	public void setMatchDate(Date matchDate) {
		this.matchDate = matchDate;
	}

	public String getVideoPath() {
		return videoPath;
	}

	public void setVideoPath(String videoPath) {
		this.videoPath = videoPath;
	}

	@Enumerated(EnumType.STRING)
	public VideoTypeEnum getVideoType() {
		return videoType;
	}

	public void setVideoType(VideoTypeEnum videoType) {
		this.videoType = videoType;
	}

	public String getVideoDesc() {
		return videoDesc;
	}

	public void setVideoDesc(String videoDesc) {
		this.videoDesc = videoDesc;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	private PeriodEnum period;

	private Player player;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "player_id")
	public Player getPlayer() {
		return player;
	}

	public void setPlayer(Player player) {
		this.player = player;
	}

	@Enumerated(value = EnumType.STRING)
	public PeriodEnum getPeriod() {
		return period;
	}

	public void setPeriod(PeriodEnum period) {
		this.period = period;
	}

}
