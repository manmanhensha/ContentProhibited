package com.bootdo.work.dao;

import com.bootdo.system.domain.UserDO;
import com.bootdo.work.domain.WorkAddDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Mapper
public interface WorkOvertimeDao {
    public List<WorkAddDO> list(Map<String, Object> map);

    void save(WorkAddDO workAddDO);

    int count(Map<String, Object> map);

    List<WorkAddDO> listName();

    int remove(Long id);

    int update(WorkAddDO workAddDO);

    WorkAddDO get(Long id);

    List<WorkAddDO> getTimeList(Date date);

    String getNumByName(String name);

    List<UserDO> getWorkerList();


    int batchRemove(Long[] ids);

    int saveIds(List<Long> ids);
}
