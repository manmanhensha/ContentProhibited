package com.bootdo.contentProhibited.controller;

import com.bootdo.common.utils.PageUtils;
import com.bootdo.common.utils.R;
import com.bootdo.contentProhibited.dto.PartitionInDTO;
import com.bootdo.contentProhibited.dto.PartitionOutDTO;
import com.bootdo.contentProhibited.dto.ProhibitedDO;
import com.bootdo.contentProhibited.dto.ProhibitedOutDTO;
import com.bootdo.contentProhibited.service.ProhibitedService;
import com.bootdo.contentProhibited.util.CommunityPage;
import com.google.common.collect.Lists;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Objects;

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
		CommunityPage query = CommunityPage.newInstance(params);

		String code = "";
		if (Objects.nonNull(params.get("code"))) {
			code = params.get("code").toString();
		}
		PartitionInDTO<String> inDTO = new PartitionInDTO<>();
		inDTO.setPageNum(query.getPageNum());
		inDTO.setPageSize(query.getLimit());
		inDTO.setInDTO(code);
		PartitionOutDTO<ProhibitedOutDTO> outDTO = service.selectProhibitedList(inDTO);
		return CommunityPage.getPageUtils(outDTO);
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

	/**
	 * 删除
	 */
	@PostMapping("/batchRemove")
	@ResponseBody
	public R remove(@RequestParam("ids[]") String[] prohibitedIds) {
		if (prohibitedIds != null && prohibitedIds.length > 0) {
			List<String> plist = Lists.newArrayList(prohibitedIds);
			boolean outDTO = service.insertProhibitedList(plist);
			if (outDTO) {
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
	public R refreshProhibitedList() {
		try {
			service.refreshProhibitedList();
		} catch (RuntimeException e) {
			return R.error(e.getMessage());
		}
		return R.ok();
	}

}
