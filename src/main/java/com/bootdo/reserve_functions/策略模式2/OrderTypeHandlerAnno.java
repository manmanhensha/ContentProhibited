package com.bootdo.reserve_functions.策略模式2;

import java.lang.annotation.*;

/**
 * @author wushiqiang
 * @date Created in 14:39 2021/11/3
 * @description
 * @modified By
 * /**
 * * 订单类型注解
 * * 使用方式：
 * * 1：普通订单 @OrderTypeHandlerAnno("1")
 * * 2：团购订单 @OrderTypeHandlerAnno("2")
 * * 3：促销订单 @OrderTypeHandlerAnno("3")
 */
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
public @interface OrderTypeHandlerAnno {
	OrderTypeEnum value();
}
