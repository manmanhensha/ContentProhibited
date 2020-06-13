package com.bootdo.reserve_functions.excellog.dao;

import com.bootdo.reserve_functions.excellog.domain.ExportExcelLogDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 运营管理系统导出Excel日志记录
 *
 * @author MrWu
 * @email 1992lcg@163.com
 * @date 2019-10-28 16:57:30
 */
@Mapper
public interface ExportExcelLogDao {

	ExportExcelLogDO get(Integer id);

	List<ExportExcelLogDO> list(Map<String, Object> map);

	int count(Map<String, Object> map);

	/**
	 * 保存日志
	 */
	int save(ExportExcelLogDO exportExcelLog);

	int update(ExportExcelLogDO exportExcelLog);

	int remove(Integer id);

	int batchRemove(Integer[] ids);
}
