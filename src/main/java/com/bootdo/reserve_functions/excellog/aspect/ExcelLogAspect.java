package com.bootdo.reserve_functions.excellog.aspect;

import cn.hutool.core.util.ObjectUtil;
import com.bootdo.common.utils.ShiroUtils;
import com.bootdo.reserve_functions.excellog.dao.ExportExcelLogDao;
import com.bootdo.reserve_functions.excellog.domain.ExportExcelLogDO;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.util.Date;

/**
 * @author wushiqiang
 * @date Created in 9:54 2019/10/29
 * @description
 * @modified By
 */
@Aspect
@Component
@Slf4j
public class ExcelLogAspect {

	@Autowired
	private ExportExcelLogDao exportExcelLogDao;


	@Pointcut("@annotation(com.bootdo.reserve_functions.excellog.aspect.ExcelLog)")
	public void logPointCut() {
	}

	@Around("logPointCut()")
	public Object around(ProceedingJoinPoint point) throws Throwable {
		// 执行方法
		Object result = point.proceed();

		MethodSignature signature = (MethodSignature) point.getSignature();
		Method method = signature.getMethod();
		ExportExcelLogDO excelLogDO = new ExportExcelLogDO();

		ExcelLog excelLog = method.getAnnotation(ExcelLog.class);

		if (ObjectUtil.isNotNull(excelLog)) {
			// 注解上的描述
			excelLogDO.setExcelName(excelLog.excelName());
			excelLogDO.setRequestURL(excelLog.requestURL());
		}

		excelLogDO.setName(String.valueOf(ShiroUtils.getUser().getName()));
		excelLogDO.setUserName(ShiroUtils.getUser().getUsername());
		excelLogDO.setCreateTime(new Date());

		exportExcelLogDao.save(excelLogDO);

		return result;
	}

}
