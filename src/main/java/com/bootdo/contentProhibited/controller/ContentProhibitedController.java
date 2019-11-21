package com.bootdo.contentProhibited.controller;

import com.bootdo.common.utils.R;
import com.bootdo.contentProhibited.service.ProhibitedService;
import lombok.extern.slf4j.Slf4j;
import lombok.val;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

/**
 * @Author: wushiqiang
 * @Date: Created in 20:30 2019/11/21
 * @Description:
 * @Modified By:
 */
@Controller
@RequestMapping("/prohibited")
@Slf4j
public class ContentProhibitedController {

	@Autowired
	private ProhibitedService service;

	@GetMapping()
	String a() {
		return "community/prohibited/contentProhibited";
	}


	@ResponseBody
	@PostMapping(value = "contentProhibited")
	public R testConternt(String content) {
		val strings = service.matchWords(content);
		HashMap<String, Object> map = new HashMap<>(12);
		map.put("keywords", strings);
		map.put("content", content);
		return R.ok(map);
	}

}
