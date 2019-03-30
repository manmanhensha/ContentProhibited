package com.bootdo.work.service;

import com.bootdo.common.utils.Query;
import com.bootdo.system.domain.UserDO;
import com.bootdo.work.domain.WorkAddDO;

import java.util.List;

public interface MyWorkOvertimeService {
    List<WorkAddDO> list(Query query);

    int count(Query query);

    UserDO getUserByUsername(String username);

    boolean save(WorkAddDO workAddDO,String username);

    WorkAddDO get(Long id);

    int update(WorkAddDO workAddDO,String username);

    int remove(Long id);

    int batchRemove(Long[] ids);
}
