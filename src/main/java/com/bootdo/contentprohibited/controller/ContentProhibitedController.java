package com.bootdo.contentprohibited.controller;

import cn.hutool.bloomfilter.BitSetBloomFilter;
import cn.hutool.bloomfilter.BloomFilterUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.bootdo.common.utils.R;
import com.bootdo.contentprohibited.service.ProhibitedService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

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
		// 返回页面地址
		return "community/contentProhibited/content";
	}

	@ResponseBody
	@PostMapping(value = "contentProhibited")
	public R testConternt(@RequestBody String content) {
		if (StrUtil.isNotBlank(content)) {
			List<String> strings = service.matchWords(content);
			final List<String> collect = strings.stream().distinct().collect(Collectors.toList());
			long startTime = System.currentTimeMillis();

			if (CollUtil.isNotEmpty(collect)) {
				for (String s : collect) {
					content = StrUtil.replace(content, s,
							"<span style=\"color: rgb(255, 0, 0);\">" + s + "</span>");
				}
			}

			HashMap<String, Object> map = new HashMap<>(12);
			map.put("keywords", collect);
			map.put("content", content);
			log.warn("耗时 : " + (System.currentTimeMillis() - startTime) + " 毫秒");

			return R.ok(map);
		} else {
			return R.error("请输入合法文本内容！");
		}
	}

	public static void main(String[] args) {
		// 布隆过滤java实现
		BitSetBloomFilter bitSet = BloomFilterUtil.createBitSet(1000000, 500000, 45);
		long current = System.currentTimeMillis();
		for (int i = 0; i < 1000000; i++) {
			bitSet.add("" + i);
		}

		int count = 0;
		for (int i = 1000000; i < 2000000; i++) {
			if (bitSet.contains(String.valueOf(i))) {
				count++;
				System.out.println(i + " 误判了");
			}
		}
		System.out.println(bitSet.getFalsePositiveProbability());
		System.err.println("有" + count + "个误判了！经过 " + (System.currentTimeMillis() - current) + "ms");

	}

}



























