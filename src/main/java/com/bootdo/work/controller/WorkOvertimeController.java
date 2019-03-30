package com.bootdo.work.controller;

import com.bootdo.common.controller.BaseController;
import com.bootdo.common.utils.PageUtils;
import com.bootdo.common.utils.Query;
import com.bootdo.common.utils.R;
import com.bootdo.system.domain.UserDO;
import com.bootdo.work.domain.WorkAddDO;
import com.bootdo.work.service.WorkOvertimeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/work/overtime")
public class WorkOvertimeController extends BaseController {
    @Autowired
    WorkOvertimeService workService;

    /**
     * 初始化页面
     * @return
     */
    @GetMapping()
    @RequiresPermissions("work:overtime")
    String dict() {
        return "work/overtime/dict";
    }


    /**
     * 加班信息查询列表
     * @return 分页集合
     */
    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("work:overtime")
    public PageUtils list(@RequestParam Map<String, Object> params){
        if (params.size()==0){
            return null;
        }else {
            String string = (String) params.get("beginTime");
            //处理时间便于区间搜索
            if (string != null && string != "") {
                SimpleDateFormat lsdStrFormat = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    Date beginDate = lsdStrFormat.parse(string);
                    long beginTime = beginDate.getTime();
                    Long endTime = beginTime + 60 * 60 * 1000 * 24;
                    params.put("endTime", endTime);
                    params.put("beginTime", beginTime);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }
            Query query = new Query(params);
            List<WorkAddDO> workAddDOS = workService.list(query);
            int total = workService.count(query);
            PageUtils pageUtils = new PageUtils(workAddDOS, total);
            return pageUtils;
        }
    }

    /**
     * 页面搜索框名字列表
     * @return
     */
    @GetMapping("/name")
    @ResponseBody
    @RequiresPermissions("work:overtime")
    public List<WorkAddDO> listName() {
        return workService.listName();
    };

   /* @ResponseBody
    @GetMapping("/list/{name}")
    public List<WorkAddDO> listByType(@PathVariable("name") String name) {
        // 查询列表数据
        Map<String, Object> map = new HashMap<>(16);
        map.put("name", name);
        Query query = new Query(map);
        List<WorkAddDO> workAddDOList = workService.list(query);
        return workAddDOList;
    }*/

    /**
     * 单独添加
     * @return
     */
    @GetMapping("/add")
    @RequiresPermissions("work:overtime:add")
    public String add() {
        return "work/overtime/add";
    }

    /**
     * 批量添加
     * @return
     */
    @GetMapping("/adds")
    @RequiresPermissions("work:overtime:add")
    public String adds() {
        return "work/overtime/adds";
    }


    /**
     * 单独添加保存数据库
     * @param workAddDO
     * @return
     */
    @PostMapping("/save")
    @ResponseBody
    @RequiresPermissions("work:overtime:add")
    public R save(WorkAddDO workAddDO){
        boolean b = workService.save(workAddDO);
        if (b){
            return R.ok("添加成功");
        }else {
            return R.error();
        }
    }


    /**
     * 批量添加保存数据库
     * @param ids
     * @return
     */
    @PostMapping("/saveIds")
    @ResponseBody
    @RequiresPermissions("work:overtime:add")
    public R saves(@RequestParam("ids[]")Long[] ids,@RequestParam("beginTime") Date beginTime,@RequestParam("endTime") Date endTime,@RequestParam("state")Integer state){
          if (ids != null && ids.length>0) {
            int i = workService.save(ids,beginTime,endTime,state);
            if (i > 0 && i< ids.length) {
                return R.error("丢失数据");
            }else {
                return R.ok();
            }
          }
        return R.error();
    }


    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("work:overtime:remove")
    public R remove(Long id) {
        int b = workService.remove(id);
        if (b > 0){
            return R.ok("删除成功");
        }else {
            return R.error();
        }
    }

    /**
     * 批量删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("work:overtime:remove")
    public R remove(@RequestParam("ids[]")Long[] ids) {
        int b = workService.batchRemove(ids);
        if (b==ids.length){
            return R.ok();
        }else {
            return R.error();
        }
    }

    /**
     * 修改面板数据回显
     *
     */
    @GetMapping("/edit/{id}")
    @RequiresPermissions("work:overtime:edit")
    public String edit(@PathVariable("id") Long id,Model model) {
        WorkAddDO workAddDO = workService.get(id);
        model.addAttribute("workAddDo", workAddDO);
        return "work/overtime/edit";
    }

    /**
     * 修改加班信息
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("work:overtime:edit")
    public R update(WorkAddDO workAddDO) {
        int b = workService.update(workAddDO);
        if (b>0){
            return R.ok("修改成功");
        }else {
            return R.error();
        }
    }



    //获取员工名字
    @GetMapping("/worker")
    @ResponseBody
    @RequiresPermissions("work:overtime:add")
    public List<UserDO> getWorkerList() {
        List<UserDO> list = workService.getWorkerList();
        return list;
    };
}
