package org.hustsse.football.web;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.hustsse.football.entity.BodyInfo;
import org.hustsse.football.entity.Player;
import org.hustsse.football.entity.Skills;
import org.hustsse.football.enums.PeriodEnum;
import org.hustsse.football.service.BodyInfoService;
import org.hustsse.football.service.PlayerService;
import org.hustsse.football.service.SkillsService;
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
import org.springframework.web.context.support.ServletContextResource;
import org.springframework.web.multipart.MultipartFile;

/**
 * 运动员数据页：
 * 1. 数据首页
 * 2. 体能
 * 3. 技战术
 * 4. 设备采集
 * @author Anderson
 *
 */
@Controller
@RequestMapping(value = "/data/player")
public class DataPlayerController {

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

	/**
	 * 数据查看首页
	 * @param playerId
	 * @return
	 */
	@RequestMapping(value = "/index")
	public String index(@ModelAttribute("playerId") Long playerId) {
		return "data-player";
	}

	/**
	 * 查看某个球员的体能信息
	 *
	 * @param account
	 * @return
	 */
	@RequestMapping(value = "/body-info")
	public String bodyInfo(@ModelAttribute("playerId") Long playerId, Date date, @ModelAttribute("period") PeriodEnum period, ModelMap map) {
		BodyInfo info = bodyInfoService.findByPlayerAndDate(playerId, date, period);
		map.put("info", info);
		map.put("date", new SimpleDateFormat("yyyy-MM-dd").format(date));
		return "data-body-info";
	}

	@RequestMapping(value = "/import-excel")
	@ResponseBody
	public AjaxResult importExcel(MultipartFile excel, String[] attr, Long playerId, Date date, PeriodEnum period, String entity)
			throws IOException, ClassNotFoundException, InstantiationException, IllegalAccessException, InvalidFormatException {
		Object instance = newOrFindEntityInstance(playerId, date, period, entity);

		// 设置值
		Workbook wb = WorkbookFactory.create(excel.getInputStream());
		Sheet sheet = wb.getSheetAt(0);
		Row row = sheet.getRow(1); // 第二行
		for (int i = 0; i < attr.length; i++) {
			row.getCell(i).setCellType(Cell.CELL_TYPE_STRING);
			ReflectionUtils.setFieldValue(instance, attr[i], row.getCell(i).getStringCellValue());
		}

		saveOrUpdateEntity(instance);
		return new AjaxResult();
	}

	private void saveOrUpdateEntity(Object instance) {
		if (instance instanceof BodyInfo) {
			bodyInfoService.save((BodyInfo) instance);
		}else if(instance instanceof Skills) {
			skillsService.save((Skills) instance);
		}
	}

	private Object newOrFindEntityInstance(Long playerId, Date date, PeriodEnum period, String entity) throws ClassNotFoundException,
			InstantiationException, IllegalAccessException {
		Object instance = null;
		if (entity.equals("BodyInfo")) {
			instance = bodyInfoService.findByPlayerAndDate(playerId, date, period);
		}else if(entity.equals("Skills")) {
			instance = skillsService.findByPlayerAndDate(playerId, date, period);
		}

		if (instance == null) {
			Class clazz = Class.forName("org.hustsse.football.entity." + entity);
			instance = clazz.newInstance();
		}

		Player p = new Player();
		p.setId(playerId);
		ReflectionUtils.setFieldValue(instance, "player", p);
		ReflectionUtils.setFieldValue(instance, "period", period);
		ReflectionUtils.setFieldValue(instance, "date", date);
		return instance;
	}

	@Value("#{mvcProp.upload_img_folder}")
	Resource uploadImgDir;

	@RequestMapping(value = "/import-img")
	@ResponseBody
	public AjaxResult importImg(MultipartFile img, String attr, Long playerId, Date date, PeriodEnum period, String entity)
			throws ClassNotFoundException, InstantiationException, IllegalAccessException, IOException {
		// 得到entity。可能是find的，也可能是new的
		Object instance = newOrFindEntityInstance(playerId, date, period, entity);

		// 保存图片
		File imgDir = uploadImgDir.getFile();
		if (!imgDir.exists())
			imgDir.mkdirs();
		String newImgName = playerId + "_" + new SimpleDateFormat("yyyy-MM-dd").format(date) + "_" + period + "_"+ entity + "_"+attr +"."
				+ img.getOriginalFilename().split("\\.")[1];
		File dest = new File(imgDir, newImgName);
		img.transferTo(dest);

		// 设置entity对应属性，值为图片路径
		String imgRelativePath = ((ServletContextResource) uploadImgDir).getPathWithinContext() + "/" + newImgName;
		ReflectionUtils.setFieldValue(instance, attr, imgRelativePath);

		// save or update
		saveOrUpdateEntity(instance);

		// 返回图片路径
		return new AjaxResult(imgRelativePath);
	}


	/**
	 * 查看某个球员的技战术信息
	 *
	 * @param account
	 * @return
	 */
	@RequestMapping(value = "/skills")
	public String skills(@ModelAttribute("playerId") Long playerId, Date date, @ModelAttribute("period") PeriodEnum period, ModelMap map) {
		Skills s = skillsService.findByPlayerAndDate(playerId, date, period);
		map.put("s", s);
		map.put("player", playerService.findById(playerId));
		map.put("date", new SimpleDateFormat("yyyy-MM-dd").format(date));
		return "data-skills";
	}

}