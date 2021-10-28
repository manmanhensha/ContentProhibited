package com.bootdo.reserve_functions.策略模式;

import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Map;

@Configuration
public class BizConfig {

    @Bean(value = "bucketBizMap")
    public Map<DomainCode, BucketBiz> initBucket(@Qualifier("huaweiBucketBiz") BucketBiz huaweiBucketBiz,
                                                 @Qualifier("tencentBucketBiz") BucketBiz tencentBucketBiz) {
        Map<DomainCode, BucketBiz> map = Maps.newEnumMap(DomainCode.class);
        map.put(DomainCode.Huawei, huaweiBucketBiz);
        map.put(DomainCode.Tencent, tencentBucketBiz);
        return map;
    }

    @Bean(value = "objectsBizMap")
    public Map<DomainCode, ObjectsBiz> initObjects(@Qualifier("huaweiObjectsBiz") ObjectsBiz huaweiObjectsBiz) {
        Map<DomainCode, ObjectsBiz> map = Maps.newEnumMap(DomainCode.class);
        map.put(DomainCode.Huawei, huaweiObjectsBiz);
        return map;
    }
}
