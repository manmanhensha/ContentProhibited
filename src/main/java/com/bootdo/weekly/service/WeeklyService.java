package com.bootdo.weekly.service;

import com.bootdo.weekly.domain.WeeklyDO;
import com.bootdo.weekly.vo.WeeklyVO;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author wushiqiang
 * @email 1992lcg@163.com
 * @date 2019-03-04 16:16:44
 */
public interface WeeklyService {
	
	WeeklyDO get(Integer id);

	WeeklyDO getByTime(String calendarTime, Long userId);

	List<WeeklyVO> list(Map<String, Object> map);

	List<WeeklyVO> listPerson(Map<String, Object> map);

	List<WeeklyVO> listWeekly(Long userId);

	int count(Map<String, Object> map);

	int countPerson(Map<String, Object> map);

	int save(WeeklyDO weekly);

	int update(WeeklyDO weekly);

	int updateRead(WeeklyDO weekly);

	int remove(Integer id);

	int batchRemove(Integer[] ids);

}
