package com.bootdo.reserve_functions.future;

import java.util.concurrent.ThreadLocalRandom;
import java.util.concurrent.TimeUnit;

/**
 * @author wushiqiang
 * @date Created in 10:57 2022/2/24
 */
public class ScoreQuery implements Computable<String, Integer> {

	@Override
	public Integer compute(String userName) throws Exception {
		System.out.println("开始查询userName=" + userName + "的分数");
		//模拟耗时
		TimeUnit.SECONDS.sleep(5);
		return ThreadLocalRandom.current().nextInt(380, 420);
	}
}
