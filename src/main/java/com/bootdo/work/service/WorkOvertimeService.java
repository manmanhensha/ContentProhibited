package com.bootdo.work.service;



import com.bootdo.system.domain.UserDO;
import com.bootdo.work.domain.WorkAddDO;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface WorkOvertimeService {
    public List<WorkAddDO> list(Map<String, Object> map);

    boolean save(WorkAddDO workAddDO);

    int save(Long[] Ids,Date biginTime,Date endTime,Integer state);

    int count(Map<String, Object> map);

    List<WorkAddDO> listName();


    int remove(Long id);

    int update(WorkAddDO workAddDO);

    WorkAddDO get(Long id);

    List<WorkAddDO> getTimeList(Date date);

    String getNumByName(String name);

    List<UserDO> getWorkerList();

    int batchRemove(Long[] ids);
}
