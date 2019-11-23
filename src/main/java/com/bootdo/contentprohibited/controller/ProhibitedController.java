package com.bootdo.contentprohibited.controller;

import com.bootdo.common.utils.PageUtils;
import com.bootdo.common.utils.Query;
import com.bootdo.common.utils.R;
import com.bootdo.contentprohibited.domain.ProhibitedEntity;
import com.bootdo.contentprohibited.dto.ProhibitedDO;
import com.bootdo.contentprohibited.service.ProhibitedService;
import com.google.common.collect.Lists;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 违禁词表
 *
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2018-12-24 10:41:27
 */

@Controller
@RequestMapping("/community/prohibited")
public class ProhibitedController {

	@Autowired
	private ProhibitedService service;

	@GetMapping()
	String a() {
		return "community/prohibited/prohibited";
	}

	@ResponseBody
	@GetMapping("/list")
	public PageUtils list(@RequestParam Map<String, Object> params) {
		//查询列表数据
		Query query = new Query(params);

		List<ProhibitedEntity> prohibitedList = service.list(query);
		return new PageUtils(prohibitedList, prohibitedList.size());
	}

	@GetMapping("/add")
	String add() {
		return "community/prohibited/add";
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@PostMapping("/save")
	public R save(ProhibitedDO prohibited) {

		if (StringUtils.isNotBlank(prohibited.getCode())) {
			String[] pArray = StringUtils.split(prohibited.getCode(), "，");
			List<String> plist = Lists.newArrayList(pArray);
			boolean outDTO = service.insertProhibitedList(plist);
			if (outDTO) {
				return R.ok();
			} else {
				return R.error();
			}
		} else {
			return R.error("未填写违禁词");
		}
	}

	@GetMapping("/edit/{prohibitedId}")
	String edit(@PathVariable("prohibitedId") String prohibitedId, Model model) {
		ProhibitedEntity prohibited = service.get(prohibitedId);
		model.addAttribute("prohibited", prohibited);

		return "community/prohibited/edit";
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@PostMapping("/update")
	public R update(ProhibitedEntity prohibited) {

		service.editProhibited(prohibited);
		return R.ok();
	}

	/**
	 * 单个删除
	 */
	@PostMapping("/remove")
	@ResponseBody
	public R remove(String prohibitedId) {
		if (service.deleteProhibitedOne(prohibitedId) > 0) {
			return R.ok();
		}
		return R.error();
	}

	/**
	 * 批量删除
	 */
	@PostMapping("/batchRemove")
	@ResponseBody
	public R remove(@RequestParam("ids[]") String[] prohibitedIds) {
		if (prohibitedIds != null && prohibitedIds.length > 0) {
			List<String> plist = Lists.newArrayList(prohibitedIds);
			if (service.deleteProhibitedList(plist)) {
				return R.ok();
			} else {
				return R.error();
			}
		} else {
			return R.error("未选择违禁词");
		}
	}

	/**
	 * 刷新违禁词列表
	 *
	 * @return
	 */
	@GetMapping(value = "refreshProhibitedList")
	@ResponseBody
	public R refreshProhibitedList() {
		try {
			service.refreshProhibitedList();
		} catch (RuntimeException e) {
			return R.error(e.getMessage());
		}
		return R.ok();
	}

}
