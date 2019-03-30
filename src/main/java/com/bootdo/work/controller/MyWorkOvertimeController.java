package com.bootdo.work.controller;

import com.bootdo.common.config.BootdoConfig;
import com.bootdo.common.utils.PageUtils;
import com.bootdo.common.utils.Query;
import com.bootdo.common.utils.R;
import com.bootdo.system.domain.UserDO;
import com.bootdo.work.domain.WorkAddDO;
import com.bootdo.work.service.MyWorkOvertimeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/work/myovertime")
public class MyWorkOvertimeController {
    @Autowired
    BootdoConfig bootdoConfig;
    @Autowired
    MyWorkOvertimeService myWorkOvertimeService;

    /**
     * 初始化页面
     * @return
     */
    @GetMapping()
    @RequiresPermissions("work:myovertime")
    String dict() {
        return "work/myovertime/dict";
    }
    /**
     * 加班信息查询列表
     * @return 分页集合
     */
    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("work:myovertime")
    public PageUtils list(@RequestParam Map<String, Object> params){
        String string = (String)params.get("beginTime");
        if (string != null && string != ""){
            SimpleDateFormat lsdStrFormat = new SimpleDateFormat("yyyy-MM-dd");
            try {
                Date parse = lsdStrFormat.parse(string);
                long begin = parse.getTime();
                Long endTime = begin + 60*60*1000*24;
                params.put("endTime",endTime);
                params.put("beginTime",begin);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        params.put("username",bootdoConfig.getUsername());
        Query query = new Query(params);
        List<WorkAddDO> workAddDOS = myWorkOvertimeService.list(query);
        int total = myWorkOvertimeService.count(query);
        PageUtils pageUtils = new PageUtils(workAddDOS, total);
        return pageUtils;
    }

    /**
     * 新增+新增面板数据回显
     * @return
     */
    @GetMapping("/add")
    @RequiresPermissions("work:myovertime:add")
    public String add(Model model) {
        String username = bootdoConfig.getUsername();
        UserDO userDO = myWorkOvertimeService.getUserByUsername(username);
        model.addAttribute("userDO",userDO);
        return "work/myovertime/add";
    }

    /**
     * 单独添加保存数据库
     * @param workAddDO
     * @return
     */
    @PostMapping("/save")
    @ResponseBody
    @RequiresPermissions("work:myovertime:add")
    public R save(WorkAddDO workAddDO){
        String username = bootdoConfig.getUsername();
        boolean b = myWorkOvertimeService.save(workAddDO,username);
        if (b){
            return R.ok("添加成功");
        }else {
            return R.error();
        }
    }


    /**
     * 修改数据回显
     * @param id
     * @param model
     * @return
     */
    @GetMapping("/edit/{id}")
    @RequiresPermissions("work:myovertime:edit")
    public String edit(@PathVariable("id") Long id,Model model) {
        WorkAddDO workAddDO = myWorkOvertimeService.get(id);
        model.addAttribute("workAddDo", workAddDO);
        return "work/myovertime/edit";
    }

    /**
     * 修改加班信息
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("work:myovertime:edit")
    public R update(WorkAddDO workAddDO) {
        String username = bootdoConfig.getUsername();
        int b = myWorkOvertimeService.update(workAddDO,username);
        if (b>0){
            return R.ok("修改成功");
        }else {
            return R.error();
        }
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("work:myovertime:remove")
    public R remove(Long id) {
        int b = myWorkOvertimeService.remove(id);
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
    @RequiresPermissions("work:myovertime:remove")
    public R remove(@RequestParam("ids[]")Long[] ids) {
        int b = myWorkOvertimeService.batchRemove(ids);
        if (b==ids.length){
            return R.ok();
        }else {
            return R.error();
        }
    }

}
