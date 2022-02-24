package com.bootdo.reserve_functions.future;

import java.util.concurrent.*;

/**
 * @author wushiqiang
 * @date Created in 10:54 2022/2/24
 * 缓存的装饰器模式
 */
public class Memoizer<A, V> implements Computable<A, V> {
	private final ConcurrentMap<A, Future<V>> cache = new ConcurrentHashMap<A, Future<V>>();

	private final Computable<A, V> c;

	public Memoizer(Computable<A, V> c) {
		this.c = c;
	}

	@Override
	public V compute(final A arg) throws Exception {
		while (true) {
			Future<V> f = cache.get(arg);
			if (f == null) {
				Callable<V> callable = new Callable<V>() {
					@Override
					public V call() throws Exception {
						return c.compute(arg);
					}
				};
				FutureTask<V> ft = new FutureTask<V>(callable);
				f = cache.putIfAbsent(arg, ft);
				if (f == null) {
					f = ft;
					ft.run();
				}
			}
			try {
				return f.get();
			} catch (CancellationException e) {
				cache.remove(arg, f);
			} catch (ExecutionException e) {
				throw e;
			}
		}
	}
}
