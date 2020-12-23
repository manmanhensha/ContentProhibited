package com.bootdo.reserve_functions;

import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;

/**
 * @Author: wushiqiang
 * @Date: Created in 21:45 2020/8/1
 * @Description: Java中的原子操作，高并发map相关方法
 * @Modified By:
 */
public class Monitor {
	private Map<MonitorKey, MonitorValue> monitors = new ConcurrentHashMap<>(48);

	public static void main(String[] args) {
		Monitor monitor = new Monitor();
		monitor.visit("www.baidu.com", "baidu", System.currentTimeMillis());
	}

	/**
	 * 比较低级的做法直接加synchronized关键字
	 * 并发量最高的需求：统计接口的平均响应时间和启动以来的请求数。
	 *
	 * @param url      请求的URL
	 * @param desc     描述
	 * @param timeCost 请求时间
	 */
	private void visit(String url, String desc, long timeCost) {
		MonitorKey key = new MonitorKey(url, desc);
		// putIfAbsent有可能返回null，需要判断，否则访问value时，会抛空指针异常
		// 要单独判断空，不是很优雅
//		MonitorValue value = new MonitorValue();
//		MonitorValue oldValue = monitors.putIfAbsent(key, value);
//		if (oldValue != null) {
//			value = oldValue;
//		}
		// jdk1.8中computeIfAbsent有bug，存入两个相同hashcode，这个方法会死循环
		// 1.9之后已经修复，如果要是存入对象一定要实现hashCode方法
		MonitorValue value = monitors.computeIfAbsent(key, k -> new MonitorValue());

		value.count.getAndIncrement();
		value.totalTime.getAndAdd(timeCost);
		value.avgTime = value.totalTime.get() / value.count.get();

		System.out.println(monitors.toString());
	}

	public static class MonitorKey {
		String key;
		String desc;

		MonitorKey(String key, String desc) {
			this.key = key;
			this.desc = desc;
		}

		@Override
		public boolean equals(Object o) {
			if (this == o) return true;
			if (!(o instanceof MonitorKey)) return false;

			MonitorKey that = (MonitorKey) o;

			if (key != null ? !key.equals(that.key) : that.key != null) return false;
			return desc != null ? desc.equals(that.desc) : that.desc == null;
		}

		@Override
		public int hashCode() {
			int result = key != null ? key.hashCode() : 0;
			result = 31 * result + (desc != null ? desc.hashCode() : 0);
			return result;
		}

		@Override
		public String toString() {
			return "MonitorKey{" +
					"key='" + key + '\'' +
					", desc='" + desc + '\'' +
					'}';
		}
	}

	public static class MonitorValue {
		AtomicInteger count = new AtomicInteger();
		float avgTime;
		AtomicLong totalTime = new AtomicLong();

		@Override
		public String toString() {
			return "MonitorValue{" +
					"count=" + count +
					", avgTime=" + avgTime +
					", totalTime=" + totalTime +
					'}';
		}

		@Override
		public boolean equals(Object o) {
			if (this == o) return true;
			if (!(o instanceof MonitorValue)) return false;
			MonitorValue that = (MonitorValue) o;
			return Float.compare(that.avgTime, avgTime) == 0 &&
					Objects.equals(count, that.count) &&
					Objects.equals(totalTime, that.totalTime);
		}

		@Override
		public int hashCode() {
			return Objects.hash(count, avgTime, totalTime);
		}
	}
}
