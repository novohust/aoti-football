package org.hustsse.football.web;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hustsse.football.entity.Player;
import org.hustsse.football.entity.Video;
import org.hustsse.football.enums.PeriodEnum;
import org.hustsse.football.enums.VideoTypeEnum;
import org.hustsse.football.service.BodyInfoService;
import org.hustsse.football.service.CoachService;
import org.hustsse.football.service.PlayerService;
import org.hustsse.football.service.SkillsService;
import org.hustsse.football.service.TeamService;
import org.hustsse.football.service.VideoService;
import org.hustsse.football.utils.ReflectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.support.ServletContextResource;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value = "/video")
public class VideoController {
	/*
	 * 表单提交日期绑定
	 */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@Autowired
	BodyInfoService bodyInfoService;
	@Autowired
	SkillsService skillsService;
	@Autowired
	PlayerService playerService;
	@Autowired
	VideoService videoService;
	@Autowired
	CoachService coachService;
	@Autowired
	TeamService teamService;

	@RequestMapping(value = "/allTypes")
	@ResponseBody
	public Map<VideoTypeEnum, String> allVideoTypes() {
		Map<VideoTypeEnum, String> map = new HashMap<VideoTypeEnum, String>();
		for (VideoTypeEnum e : VideoTypeEnum.values()) {
			map.put(e, e.getDescription());
		}
		return map;
	}

	/**
	 * player视频首页。
	 *
	 * @return
	 */
	@RequestMapping(value = "/player")
	public String playerIndex(@ModelAttribute("playerId") Long playerId) {
		return "video-player";
	}

	@RequestMapping(value = "/player-video-list")
	@ResponseBody
	public Map<VideoTypeEnum, Integer> playerList(Long playerId, Date date, PeriodEnum period) {
		Map<VideoTypeEnum, Integer> map = new LinkedHashMap<VideoTypeEnum, Integer>();
		for (VideoTypeEnum e : VideoTypeEnum.values()) {
			map.put(e, videoService.findPlayerVideos(playerId, date, period, e).size());
		}
		return map;
	}

	@RequestMapping(value = "/coach-video-list")
	@ResponseBody
	public Map<VideoTypeEnum, Integer> coachList(Long coachId, Date date, PeriodEnum period) {
		Map<VideoTypeEnum, Integer> map = new LinkedHashMap<VideoTypeEnum, Integer>();
		for (VideoTypeEnum e : VideoTypeEnum.values()) {
			map.put(e, videoService.findTeamVideos(coachService.findById(coachId).getTeam().getId(), date, period, e).size());
		}
		return map;
	}

	@RequestMapping(value = "/admin-video-list")
	@ResponseBody
	public Map<VideoTypeEnum, Integer> adminList(Long playerId, Long teamId, Date date, PeriodEnum period) {
		Map<VideoTypeEnum, Integer> map = new LinkedHashMap<VideoTypeEnum, Integer>();
		if (playerId == null) {
			for (VideoTypeEnum e : VideoTypeEnum.values()) {
				map.put(e, videoService.findTeamVideos(teamId, date, period, e).size());
			}
		} else {
			for (VideoTypeEnum e : VideoTypeEnum.values()) {
				map.put(e, videoService.findPlayerVideos(playerId, date, period, e).size());
			}
		}
		return map;
	}

	/**
	 * 教练视频首页。
	 *
	 * @return
	 */
	@RequestMapping(value = "/coach")
	public String coachIndex(@ModelAttribute("coachId") Long coachId) {
		return "video-coach";
	}

	/**
	 * 管理员视频首页。
	 *
	 * @return
	 */
	@RequestMapping(value = "/admin")
	public String adminIndex(@ModelAttribute("teamId") Long teamId, ModelMap map) {
		List<Player> players = teamService.findTeamPlayers(teamId);
		map.put("players", players);
		return "video-admin";
	}

	@Value("#{mvcProp.upload_video_folder}")
	Resource uploadVideoDir;

	@RequestMapping(value = "/upload")
	@ResponseBody
	public AjaxResult upload(MultipartFile video, Long playerId,Date date,PeriodEnum period,VideoTypeEnum videoType) throws IOException {

		// 保存视频
		File videoDir = uploadVideoDir.getFile();
		if (!videoDir.exists())
			videoDir.mkdirs();
		String newVideoName = System.currentTimeMillis() + "_" + video.getOriginalFilename();
		File dest = new File(videoDir, newVideoName);
		video.transferTo(dest);

		// 设置entity对应属性，值为视频路径
		String videoPath = ((ServletContextResource) uploadVideoDir).getPathWithinContext() + "/" + newVideoName;
		Video obj = new Video();
		Player p = new Player();
		p.setId(playerId);
		obj.setPlayer(p);
		obj.setUploadTime(new Date());
		obj.setMatchDate(date);
		obj.setPeriod(period);
		obj.setVideoPath(videoPath);
		obj.setVideoType(videoType);

		// save
		videoService.add(obj);
		return new AjaxResult();
	}
}