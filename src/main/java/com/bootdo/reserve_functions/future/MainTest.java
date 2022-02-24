package com.bootdo.reserve_functions.future;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @author wushiqiang
 * @date Created in 11:38 2022/2/22
 */
public class MainTest {
	public static void main(String[] args) {
		final ExecutorService executorService = Executors.newFixedThreadPool(5);
//		final ScoreQueryService2 scoreQueryService2 = new ScoreQueryService2();
//		多个线程并发读取缓存问题解决
		final Memoizer<String, Integer> memoizer = new Memoizer<>(new ScoreQuery());

		for (int i = 0; i < 3; i++) {
			executorService.submit(() -> {
				try {
//					final Integer query = scoreQueryService2.query("why");
					final Integer query = memoizer.compute("why");
					System.out.println(query);
				} catch (Exception e) {
					e.printStackTrace();
				}
			});
		}
	}
}
