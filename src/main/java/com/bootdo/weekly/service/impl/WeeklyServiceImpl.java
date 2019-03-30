package com.bootdo.weekly.service.impl;

import com.bootdo.common.utils.ShiroUtils;
import com.bootdo.weekly.dao.WeeklyDao;
import com.bootdo.weekly.domain.WeeklyDO;
import com.bootdo.weekly.service.WeeklyService;
import com.bootdo.weekly.vo.WeeklyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Objects;


@Service
@Transactional(rollbackFor = RuntimeException.class)
public class WeeklyServiceImpl implements WeeklyService {
	@Autowired
	private WeeklyDao weeklyDao;

	@Override
	public WeeklyDO get(Integer id) {
		return weeklyDao.get(id);
	}

	@Override
	public WeeklyDO getByTime(String calendarTime, Long userId) {
		return weeklyDao.getByTime(calendarTime, userId);
	}

	@Override
	public List<WeeklyVO> list(Map<String, Object> map) {
		return weeklyDao.list(map);
	}

	@Override
	public List<WeeklyVO> listPerson(Map<String, Object> map) {
		//向map中添加当前用户的id
		map.put("userId", ShiroUtils.getUserId());
		return weeklyDao.listPerson(map);
	}

	@Override
	public List<WeeklyVO> listWeekly(Long userId) {
		return weeklyDao.listWeekly(userId);
	}

	@Override
	public int count(Map<String, Object> map) {
		return weeklyDao.count(map);
	}

	@Override
	public int countPerson(Map<String, Object> map) {
		return weeklyDao.countPerson(map);
	}


	@Override
	public int save(WeeklyDO weekly) {
		Date saveTime = weekly.getCreateTime();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String str = format.format(saveTime);
		Long userId = ShiroUtils.getUserId();
		//根据用户输入的创建时间和用户id查找是否有同一天的记录。
		WeeklyDO timeWeekly = weeklyDao.getByTime(str, userId);
		if (Objects.nonNull(timeWeekly)) {
			return 0;
		}
		return weeklyDao.save(weekly);
	}

	@Override
	public int update(WeeklyDO weekly) {
		return weeklyDao.update(weekly);
	}

	@Override
	public int updateRead(WeeklyDO weekly) {
		weekly.setIsRead(1);
		return weeklyDao.update(weekly);
	}

	@Override
	public int remove(Integer id) {
		return weeklyDao.remove(id);
	}

	@Override
	public int batchRemove(Integer[] ids) {
		return weeklyDao.batchRemove(ids);
	}

}
