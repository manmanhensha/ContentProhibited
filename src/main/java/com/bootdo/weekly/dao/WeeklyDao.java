package com.bootdo.weekly.dao;

import com.bootdo.weekly.domain.WeeklyDO;
import com.bootdo.weekly.vo.WeeklyVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 
 * @author wushiqiang
 * @email 1992lcg@163.com
 * @date 2019-03-04 16:16:44
 */
@Mapper
public interface WeeklyDao {

	WeeklyDO get(Integer id);

	WeeklyDO getByTime(@Param("saveTime") String calendarTime, @Param("userId") Long userId);
	
	List<WeeklyVO> list(Map<String, Object> map);

	List<WeeklyVO> listPerson(Map<String, Object> map);

	List<WeeklyVO> listWeekly(Long userId);

	int count(Map<String, Object> map);

	int countPerson(Map<String, Object> map);

	int save(WeeklyDO weekly);

	int update(WeeklyDO weekly);

	int remove(Integer id);

	int batchRemove(Integer[] ids);
}
