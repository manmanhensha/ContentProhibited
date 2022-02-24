package com.bootdo.reserve_functions.future;

import java.util.Map;
import java.util.concurrent.*;

/**
 * @author wushiqiang
 * @date Created in 11:29 2022/2/22
 */
public class ScoreQueryService2 {

	public static final Map<String, Future<Integer>> SCORE_CACHE = new ConcurrentHashMap<>();

	public Integer query(String userName) throws Exception {
		while (true) {
			Future<Integer> future = SCORE_CACHE.get(userName);
			if (future == null) {
				Callable<Integer> callable = () -> loadFormDB(userName);
				FutureTask futureTask = new FutureTask<>(callable);
				FutureTask<Integer> integerFuture =
						(FutureTask) SCORE_CACHE.computeIfAbsent(userName, key -> futureTask);
				future = integerFuture;
				integerFuture.run();
			}
			try {
				return future.get();
			} catch (CancellationException e) {
				SCORE_CACHE.remove(userName, future);
			} catch (Exception e) {
				throw e;
			}
		}
	}

	private Integer loadFormDB(String userName) throws InterruptedException {
		System.out.println("开始查询userName=" + userName + "的分数");
		//模拟耗时
		TimeUnit.SECONDS.sleep(1);
		return ThreadLocalRandom.current().nextInt(380, 420);
	}
}
