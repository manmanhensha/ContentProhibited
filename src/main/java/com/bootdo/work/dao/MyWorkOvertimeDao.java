package com.bootdo.work.dao;

import com.bootdo.common.utils.Query;
import com.bootdo.system.domain.UserDO;
import com.bootdo.work.domain.WorkAddDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MyWorkOvertimeDao {
    List<WorkAddDO> list(Query query);

    int count(Query query);

    void save(WorkAddDO workAddDO);

    WorkAddDO get(Long id);

    int update(WorkAddDO workAddDO);

    int remove(Long id);

    int batchRemove(Long[] ids);
}
