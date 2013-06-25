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

/**
 * 设备采集
 *
 * @author Anderson
 *
 */
@Entity
@Table
public class DeviceInfo extends IdEntity {
	private Date date;
	private PeriodEnum period;

	private Double maxSpeed; // 最大速度
	private Double minSpeed; // 最小速度
	private Double avgSpeed; // 平均速度
	private Double avgHr; // 平均心率
	private Double minHr; // 最小心率
	private Double maxHr; // 最大心率
	private Double totalDistance; // 总距离
	private Integer recordSum; // 一共有多少检测记录

	private List<MonitorRecord> records;
	private Player player;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "player_id")
	public Player getPlayer() {
		return player;
	}

	public void setPlayer(Player player) {
		this.player = player;
	}

	public Double getMaxSpeed() {
		return maxSpeed;
	}

	public void setMaxSpeed(Double maxSpeed) {
		this.maxSpeed = maxSpeed;
	}

	public Double getMinSpeed() {
		return minSpeed;
	}

	public void setMinSpeed(Double minSpeed) {
		this.minSpeed = minSpeed;
	}

	public Double getAvgSpeed() {
		return avgSpeed;
	}

	public void setAvgSpeed(Double avgSpeed) {
		this.avgSpeed = avgSpeed;
	}

	public Double getAvgHr() {
		return avgHr;
	}

	public void setAvgHr(Double avgHr) {
		this.avgHr = avgHr;
	}

	public Double getMinHr() {
		return minHr;
	}

	public void setMinHr(Double minHr) {
		this.minHr = minHr;
	}

	public Double getMaxHr() {
		return maxHr;
	}

	public void setMaxHr(Double maxHr) {
		this.maxHr = maxHr;
	}

	public Double getTotalDistance() {
		return totalDistance;
	}

	public void setTotalDistance(Double totalDistance) {
		this.totalDistance = totalDistance;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "deviceInfo", cascade = { CascadeType.REMOVE })
	public List<MonitorRecord> getRecords() {
		return records;
	}

	public void setRecords(List<MonitorRecord> records) {
		this.records = records;
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

	public Integer getRecordSum() {
		return recordSum;
	}

	public void setRecordSum(Integer recordSum) {
		this.recordSum = recordSum;
	}

}
