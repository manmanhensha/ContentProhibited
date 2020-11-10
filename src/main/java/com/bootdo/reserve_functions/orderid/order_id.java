package com.bootdo.reserve_functions.orderid;

/**
 * @author wushiqiang
 * @date Created in 14:05 2020/11/10
 * @description
 * @modified By
 */
public class order_id {

	/**
	 * 生成18位订单编号:8位日期+2位平台号码+2位支付方式+6位以上自增id
	 */
//	private String generateOrderSn(OmsOrder order) {
//		StringBuilder sb = new StringBuilder();
//		String date = new SimpleDateFormat("yyyyMMdd").format(new Date());
//		String key = REDIS_KEY_PREFIX_ORDER_ID + date;
//		Long increment = stringRedisTemplate.opsForValue().increment(key,1);
//		sb.append(date);
//		sb.append(String.format("%02d", order.getSourceType()));
//		sb.append(String.format("%02d", order.getPayType()));
//		String incrementStr = increment.toString();
//		if (incrementStr.length() <= 6) {
//			sb.append(String.format("%06d", increment));
//		} else {
//			sb.append(incrementStr);
//		}
//		return sb.toString();
//	}
}
