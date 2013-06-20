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

/**
 * 设备采集
 * @author Anderson
 *
 */
@Entity
@Table
public class DeviceInfo extends IdEntity {

	//时间信息 TO BE CONTINUED...
	private Date infoDate;


	private Player player;

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "player_id")
	public Player getPlayer() {
		return player;
	}

	public void setPlayer(Player player) {
		this.player = player;
	}
}