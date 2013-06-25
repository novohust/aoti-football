package org.hustsse.football.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


/**
 * 一次设备监测记录
 * @author Anderson
 *
 */
@Entity
@Table
public class MonitorRecord extends IdEntity {
	private Date time;// 监控时刻
	private Double speed;//速度
	private Double runDistance;//跑动距离
	private Double hr;	// 心率

	private DeviceInfo deviceInfo;

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Double getSpeed() {
		return speed;
	}

	public void setSpeed(Double speed) {
		this.speed = speed;
	}

	public Double getRunDistance() {
		return runDistance;
	}

	public void setRunDistance(Double runDistance) {
		this.runDistance = runDistance;
	}

	public Double getHr() {
		return hr;
	}

	public void setHr(Double hr) {
		this.hr = hr;
	}

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "device_info_id")
	public DeviceInfo getDeviceInfo() {
		return deviceInfo;
	}

	public void setDeviceInfo(DeviceInfo deviceInfo) {
		this.deviceInfo = deviceInfo;
	}


}
