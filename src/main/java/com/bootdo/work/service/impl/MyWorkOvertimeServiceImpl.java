package com.bootdo.work.service.impl;

import com.bootdo.common.utils.Query;
import com.bootdo.system.dao.DeptDao;
import com.bootdo.system.dao.UserDao;
import com.bootdo.system.domain.UserDO;
import com.bootdo.work.dao.MyWorkOvertimeDao;
import com.bootdo.work.domain.WorkAddDO;
import com.bootdo.work.service.MyWorkOvertimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;
@Service
public class MyWorkOvertimeServiceImpl implements MyWorkOvertimeService{
    @Autowired
    MyWorkOvertimeDao myWorkOvertimeDao;
    @Autowired
    UserDao userDao;
    @Autowired
    DeptDao deptDao;
    @Override
    public List<WorkAddDO> list(Query query) {
      List<WorkAddDO> list = myWorkOvertimeDao.list(query);
      return list;
    }

    @Override
    public int count(Query query) {
        int total =myWorkOvertimeDao.count(query);
        return total;
    }

    @Override
    public UserDO getUserByUsername(String username) {
        UserDO userDO = userDao.getUserByUsername(username);
        return userDO;
    }

    @Override
    public boolean save(WorkAddDO workAddDO,String username) {
        try {

            setValue(workAddDO,username);

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
            myWorkOvertimeDao.save(workAddDO);
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public WorkAddDO get(Long id) {
        WorkAddDO workAddDO = myWorkOvertimeDao.get(id);
        return workAddDO;
    }

    @Override
    public int update(WorkAddDO workAddDO,String username) {
        int b = 0;
        try {
            setValue(workAddDO,username);
            DecimalFormat df = new DecimalFormat("######0.00");
            Date beginTime = workAddDO.getBeginTime();
            Date endTime = workAddDO.getEndTime();
            long time = beginTime.getTime();
            long time1 = endTime.getTime();
            String format = df.format(((time1 - time) / (1000 * 60)) / 60.0);
            workAddDO.setTimeLength(format);
            b = myWorkOvertimeDao.update(workAddDO);
        }catch(Exception e){
            e.printStackTrace();
        }
        return b;
    }

    @Override
    public int remove(Long id) {
        int b = myWorkOvertimeDao.remove(id);
        return b;
    }

    @Override
    public int batchRemove(Long[] ids) {
        int b = myWorkOvertimeDao.batchRemove(ids);
        return b;
    }

    private void setValue(WorkAddDO workAddDO,String username){


        UserDO userByUsername = userDao.getUserByUsername(username);
        workAddDO.setWorkNum(userByUsername.getUserId());
        //用户名字赋值

        workAddDO.setName(userByUsername.getName());

        //用户名赋值

        workAddDO.setUsername(username);

        //部门id并赋值
        workAddDO.setDeptId(userByUsername.getDeptId());

        String deptNameByDeptId = deptDao.getDeptNameByDeptId(userByUsername.getDeptId());
        //部门名字并赋值
        workAddDO.setDeptName(deptNameByDeptId);

    }
}
