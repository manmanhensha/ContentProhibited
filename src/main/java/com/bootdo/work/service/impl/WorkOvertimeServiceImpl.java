package com.bootdo.work.service.impl;

import com.bootdo.system.dao.DeptDao;
import com.bootdo.system.dao.UserDao;
import com.bootdo.system.domain.UserDO;
import com.bootdo.work.dao.WorkOvertimeDao;
import com.bootdo.work.domain.WorkAddDO;
import com.bootdo.work.service.WorkOvertimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class WorkOvertimeServiceImpl implements WorkOvertimeService {
    @Autowired
    WorkOvertimeDao workOvertimeDao;
    @Autowired
    UserDao userDao;
    @Autowired
    DeptDao deptDao;

    @Override
    public List<WorkAddDO> list(Map<String, Object> map) {
        List<WorkAddDO> workAddDOS = workOvertimeDao.list(map);
        return workAddDOS;
    }

    @Override
    public List<WorkAddDO> listName() {
        List<WorkAddDO> list =workOvertimeDao.listName();
        return list;
    }

    @Override
    public int remove(Long id) {
        int b = workOvertimeDao.remove(id);
        return b;
    }

    @Override
    public int update(WorkAddDO workAddDO) {
        int b = 0;
        try {
            setValue(workAddDO);
            DecimalFormat df = new DecimalFormat("######0.00");
            Date beginTime = workAddDO.getBeginTime();
            Date endTime = workAddDO.getEndTime();
            long time = beginTime.getTime();
            long time1 = endTime.getTime();
            String format = df.format(((time1 - time) / (1000 * 60)) / 60.0);
            workAddDO.setTimeLength(format);
            workAddDO.setMillisecond(time);
            b = workOvertimeDao.update(workAddDO);
        }catch(Exception e){
            e.printStackTrace();
        }
        return b;
    }

    @Override
    public WorkAddDO get(Long id) {
       WorkAddDO workAddDO = workOvertimeDao.get(id);
       return workAddDO;
    }

    @Override
    public List<WorkAddDO> getTimeList(Date date) {
        List<WorkAddDO> list = workOvertimeDao.getTimeList(date);
        return list;
    }

    @Override
    public String getNumByName(String name) {
        return workOvertimeDao.getNumByName(name);
    }

    @Override
    public List<UserDO> getWorkerList() {
       List<UserDO> list = workOvertimeDao.getWorkerList();
       return list;
    }

    @Override
    public int batchRemove(Long[] ids) {
        int b = workOvertimeDao.batchRemove(ids);
        return b;
    }


    @Override
    public boolean save(WorkAddDO workAddDO) {
        try {

            setValue(workAddDO);

            DecimalFormat df = new DecimalFormat("######0.00");
            Date beginTime = workAddDO.getBeginTime();
            Date endTime = workAddDO.getEndTime();
            long time = beginTime.getTime();
            long time1 = endTime.getTime();
            String format = df.format(((time1 - time) / (1000 * 60)) / 60.0);
            /*System.out.println("间隔小时" + df.format(((time1-time)/(1000*60))/60.0));*/
            workAddDO.setTimeLength(format);
            long time2 = beginTime.getTime();
            workAddDO.setMillisecond(time2);
            workOvertimeDao.save(workAddDO);
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /**
     * 批量添加
     * @param Ids
     * @return
     */
    @Override
    public int save(Long[] Ids,Date biginTime,Date endTime,Integer state) {
        int i = 0;
        for (Long id : Ids) {
            WorkAddDO workAddDO = new WorkAddDO();
            workAddDO.setWorkNum(id);
            workAddDO.setBeginTime(biginTime);
            workAddDO.setEndTime(endTime);
            workAddDO.setState(state);
            boolean save = save(workAddDO);
            if (save){
                i++;
                continue;
            }else{
                return i;
            }
        }
        return i;
    }

    @Override
    public int count(Map<String, Object> map) {
        int total = workOvertimeDao.count(map);
        return total;
    }

    private void setValue(WorkAddDO workAddDO){
        //根据用户id获取用户名字并赋值
        Long workNum = workAddDO.getWorkNum();
        String workName = userDao.getNameByUserId(workNum);
        workAddDO.setName(workName);

        //根据用户id获取用户名
        String username = userDao.getUsernameByUserId(workNum);
        workAddDO.setUsername(username);

        //根据用户id获取部门id并赋值
        Long deptId = userDao.getBeptIdByUserId(workNum);
        workAddDO.setDeptId(deptId);

        //根据部门id获取部门名字并赋值
        String deptName = deptDao.getDeptNameByDeptId(deptId);
        workAddDO.setDeptName(deptName);

    }
}
