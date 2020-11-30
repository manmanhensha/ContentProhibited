package com.bootdo.reserve_functions.lottyutil;

import lombok.extern.slf4j.Slf4j;

import java.util.List;

/**
 * @Author: wushiqiang
 * @Date: Created in 13:39 2019/5/7
 * @Description:
 * @Modified By:
 */
@Slf4j
public class CardMathRandom {
	/**
	 * 根据Math.random()产生一个double型的随机数，判断每个奖品出现的概率
	 *
	 * @param cardEntities
	 * @return random：奖品列表cardEntities中的序列（cardEntities中的第random个就是抽中的奖品）
	 */
	public static int getPrizeIndex(List<CardEntity> cardEntities) {
		int random = -1;
		try {
			//计算总权重
			double sumWeight = 0;
			for (CardEntity cardEntity : cardEntities) {
				sumWeight += cardEntity.getWeight();
			}
			//产生随机数
			double randomNumber;
			randomNumber = Math.random();
			//根据随机数在所有奖品分布的区域并确定所抽奖品
			double d1 = 0;
			double d2 = 0;
			for (int i = 0; i < cardEntities.size(); i++) {
				//计算当前元素占总权重的比例，百分之多少
				d2 += cardEntities.get(i).getWeight() / sumWeight;
				if (i == 0) {
					d1 = 0;
				} else {
					//计算当前元素前一个元素占总权重的比例，百分之多少
					d1 += cardEntities.get(i - 1).getWeight() / sumWeight;
				}
				if (randomNumber >= d1 && randomNumber < d2) {
					random = i;
					break;
				}
			}
		} catch (RuntimeException e) {
			log.error("生成抽奖随机数出错，出错原因：{}", e.getMessage());
		}
		return random;
	}
	/**
	 *   0<=randomNumber<0.1 表示抽中一等奖
	 0.1<=randomNumber<0.3 表示抽中二等奖
	 0.3<=randomNumber<0.6 表示抽中三等奖
	 0.6<=randomNumber<1.0 表示抽中四等奖
	 */
}
