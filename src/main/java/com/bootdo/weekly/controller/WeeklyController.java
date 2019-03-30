package com.bootdo.weekly.controller;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.TemplateExportParams;
import com.bootdo.common.utils.*;
import com.bootdo.weekly.domain.WeeklyDO;
import com.bootdo.weekly.service.WeeklyService;
import com.bootdo.weekly.vo.WeeklyVO;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author wushiqiang
 * @email
 * @date 2019-03-04 16:16:44
 */

@Controller
@RequestMapping("/weekly/weekly")
public class WeeklyController {
	@Autowired
	private WeeklyService weeklyService;

	@GetMapping()
	@RequiresPermissions("weekly:weekly:weekly")
	String Weekly() {
		return "weekly/weekly/weekly";
	}

	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("weekly:weekly:weekly")
	public PageUtils list(@RequestParam Map<String, Object> params) {
		//查询列表数据
		Query query = new Query(params);
		List<WeeklyVO> weeklyList = weeklyService.list(query);
		int total = weeklyService.count(query);
		PageUtils pageUtils = new PageUtils(weeklyList, total);
		return pageUtils;
	}

	@ResponseBody
	@GetMapping("/listPerson")
	@RequiresPermissions("weekly:weekly:weeklyPerson")
	public PageUtils listPerson(@RequestParam Map<String, Object> params) {
		//查询列表数据
		Query query = new Query(params);
		List<WeeklyVO> weeklyList = weeklyService.listPerson(query);
		int total = weeklyService.countPerson(query);
		PageUtils pageUtils = new PageUtils(weeklyList, total);
		return pageUtils;
	}

	/**
	 *
	 * @return
	 */
	@ResponseBody
	@GetMapping("/listWeekly")
	public List<WeeklyVO> listPerson() {
		return weeklyService.listWeekly(ShiroUtils.getUserId());
	}

	@GetMapping("/add")
	@RequiresPermissions("weekly:weekly:add")
	String add() {
		return "weekly/weekly/add";
	}

	@GetMapping("/calendar")
	String calendar() {
		return "weekly/weekly/calendar";
	}

	/**
	 * 浏览器通过在控制器上的mapping来查找html的位置
	 *
	 * @return html的实际地址
	 */
	@GetMapping("/weeklyContent")
	@RequiresPermissions("weekly:weekly:add")
	String weeklyContent() {
		return "weekly/weekly/weeklyContent";
	}

	@GetMapping("/edit/{id}")
	@RequiresPermissions("weekly:weekly:edit")
	String edit(@PathVariable("id") Integer id, Model model) {
		WeeklyDO weekly = weeklyService.get(id);
		model.addAttribute("weekly", weekly);
		return "weekly/weekly/edit";
	}

	@GetMapping("/editBytime/{calendarTime}")
	@RequiresPermissions(value = {"weekly:weekly:edit", "weekly:weekly:add"}, logical = Logical.OR)
	String editBytime(@PathVariable("calendarTime") String calendarTime, Model model) {
		WeeklyDO weekly = weeklyService.getByTime(calendarTime, ShiroUtils.getUserId());
		model.addAttribute("weekly", weekly);
		if (Objects.nonNull(weekly)) {
			return "weekly/weekly/edit";
		}
		return "weekly/weekly/add";
	}

	@GetMapping("/editIsRead/{id}")
	@RequiresPermissions("weekly:weekly:edit")
	String editIsRead(@PathVariable("id") Integer id, Model model) {
		WeeklyDO weekly = weeklyService.get(id);
		weeklyService.updateRead(weekly);
		model.addAttribute("weekly", weekly);
		return "weekly/weekly/edit";
	}

	@GetMapping("/get/{id}")
	@ResponseBody
	public PageUtils get(@PathVariable("id") Integer id) {
		WeeklyDO weekly = weeklyService.get(id);
		List<WeeklyDO> list = new ArrayList<>();
		list.add(weekly);
		PageUtils pageUtils = new PageUtils(list, 1);
		return pageUtils;
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("weekly:weekly:add")
	public R save(WeeklyDO weekly) {
		//验证字符串是否为空
		if (StringUtils.isNotEmpty(weekly.getWorkDes())) {
			//存入当前用户的id
			weekly.setUserId(ShiroUtils.getUserId());
			weekly.setUpdateTime(new Date());
			if (weeklyService.save(weekly) > 0) {
				return R.ok();
			}
		}
		return R.error();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("weekly:weekly:edit")
	public R update(WeeklyDO weekly) {
		weeklyService.update(weekly);
		return R.ok();
	}

	/**
	 * 删除
	 */
	@PostMapping("/remove")
	@ResponseBody
	@RequiresPermissions("weekly:weekly:remove")
	public R remove(Integer id) {
		if (weeklyService.remove(id) > 0) {
			return R.ok();
		}
		return R.error();
	}

	/**
	 * 批量删除
	 */
	@PostMapping("/batchRemove")
	@ResponseBody
	@RequiresPermissions("weekly:weekly:batchRemove")
	public R remove(@RequestParam("ids[]") Integer[] ids) {
		weeklyService.batchRemove(ids);
		return R.ok();
	}

	/**
	 * 导出Excel
	 * @Param response  param desc
	 * @Param params  param desc
	 * @Return: void
	 */
	@ResponseBody
	@RequestMapping("/exportWeekly")
	public void exportWeekly(HttpServletResponse response,@RequestParam Map<String, Object> params){
		// 判断来获取哪个集合
		List<WeeklyVO> weeklyList;
		if (Objects.nonNull(params.get("person"))){
			weeklyList = weeklyService.listPerson(params);
		}else {
			weeklyList = weeklyService.list(params);
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String createTime = sdf.format(new Date());

		//对list中的数据倒转顺序
		Collections.reverse(weeklyList);

		for (int i = 0; i < weeklyList.size(); ++i) {
			weeklyList.get(i).setOrder(i+1);
		}
		//获取导出Excel指定模板，第二个参数true代表显示一个Excel中所有的sheet
		TemplateExportParams excelParams = new TemplateExportParams("/templates/周报模板.xls",true);
		Map<String,Object> data = new HashMap<>(12);
		if (Objects.isNull(params.get("beginTime")) || StringUtils.isBlank(params.get("beginTime").toString())){
			data.put("beginTime",weeklyList.get(weeklyList.size()-1).getCreateTime());
		}else {
			data.put("beginTime",params.get("beginTime"));
		}
		data.put("endTime",params.get("endTime"));
		data.put("date",createTime);
		data.put("list",weeklyList);

		Workbook workbook = ExcelExportUtil.exportExcel(excelParams,data);
		try {
			//下载方法
			export(response,workbook,"周报");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * export导出请求头设置
	 *
	 * @param response
	 * @param workbook
	 * @param fileName
	 * @throws Exception
	 */
	private static void export(HttpServletResponse response, Workbook workbook, String fileName) throws Exception {
		response.reset();
		response.setContentType("application/x-msdownload");
		fileName = fileName + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		response.setHeader("Content-disposition", "attachment; filename=" + new String(fileName.getBytes("gb2312"), "ISO-8859-1") + ".xls");
		ServletOutputStream outStream = null;
		try {
			outStream = response.getOutputStream();
			workbook.write(outStream);
		} finally {
			outStream.close();
		}
	}

}
