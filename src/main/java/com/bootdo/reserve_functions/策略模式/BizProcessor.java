package com.bootdo.reserve_functions.策略模式;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;


@Component
public class BizProcessor {

    @Autowired
    private Map<DomainCode, BucketBiz> bucketBizMap;

    @Autowired
    private Map<DomainCode, ObjectsBiz> objectsBizMap;

    public BucketBiz getBucketBiz(DomainCode domainCode) {
        return bucketBizMap.get(domainCode);
    }

    public ObjectsBiz getObjectsBiz(DomainCode domainCode) {
        return objectsBizMap.get(domainCode);
    }


}
