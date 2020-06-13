package com.bootdo.reserve_functions.redis_util;

import cn.hutool.core.util.StrUtil;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RBucket;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

/**
 * @author wushiqiang
 * @date Created in 17:38 2019/6/23
 * @description
 * @modified By
 */
@Component
@Slf4j
public class RedisLock {

	@Autowired
	private StringRedisTemplate redisTemplate;
	@Autowired
	private RedissonClient redissonClient;

	/**
	 * 加分布式锁  利用Redis中setNX  getSet
	 * 如果加锁不成功直接抛出异常 使用: RedisLock.lock(productId, 当前时间+超时时间(10秒))
	 *
	 * @param key   订单id
	 * @param value 当前时间+超时时间
	 * @return
	 */
	public boolean lock(String key, String value) {
		if (redisTemplate.opsForValue().setIfAbsent(key, value)) {
			log.info("加锁的key:{}-- value:{}", key, value);
			return true;
		}
//		redisTemplate.opsForZSet().rank()
		// currentValue=A  这俩个线程的value都是B  其中一个线程拿到锁
		String currentValue = redisTemplate.opsForValue().get(key);
		//如果锁过期
		if (StrUtil.isNotEmpty(currentValue)
				&& Long.parseLong(currentValue) < System.currentTimeMillis()) {
			log.info("当前用户的锁过期 key:{}-- value:{}", key, value);
			// 获取上一个锁的时间
			final String oldValue = redisTemplate.opsForValue().getAndSet(key, value);
			if (StrUtil.isNotBlank(oldValue) && oldValue.equals(currentValue)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 解除redis锁
	 * 在扣除库存之后,在进行解锁操作
	 *
	 * @param key
	 * @param value
	 */
	public void unLock(String key, String value) {
		try {
			log.info("解锁的key:{}-- value:{}", key, value);
			final String currentValue = redisTemplate.opsForValue().get(key);
			if (StrUtil.isNotBlank(currentValue) && currentValue.equals(value)) {
				redisTemplate.opsForValue().getOperations().delete(key);
			}
		} catch (Exception e) {
			log.error("(redis分布式锁) 解锁异常 {}", e.getMessage());
		}
	}

	/**
	 * 向Redis中设置aid 的过期时间
	 *
	 * @param token
	 * @param aid
	 * @return
	 */
	public boolean setRedisExp(String token, String aid, int productId) {
		// 根据用户aid和商品id获取唯一对象，如果该对象set了值，则此对象存在。
		RBucket<String> bucket = redissonClient.getBucket(aid + "-" + productId);
		//检查key是否存在，返回boolean值
		if (bucket.isExists()) {
			log.warn("在缓存中未过期的aid的请求={},{}", aid, token);
			return false;
		}
		log.info("向redis里存入数据和设置缓存时间：{}，{}", aid, token);
		//向redis里存入数据和设置缓存时间
		bucket.set(token, 10, TimeUnit.SECONDS);

		return true;
	}
}
