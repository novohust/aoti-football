package org.hustsse.football.entity;

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
 * 视频
 *
 * @author Anderson
 *
 */
@Entity
@Table
public class Video extends IdEntity {

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
