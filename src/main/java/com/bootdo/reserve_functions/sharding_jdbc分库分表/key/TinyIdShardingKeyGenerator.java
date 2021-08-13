package com.bootdo.reserve_functions.sharding_jdbc分库分表.key;

import org.apache.shardingsphere.spi.keygen.ShardingKeyGenerator;
import org.springframework.stereotype.Component;

import java.util.Properties;

/**
 * @Author: xiaofu
 * @Description: 自定义主键生成器
 */
@Component
public class TinyIdShardingKeyGenerator implements ShardingKeyGenerator {

    /**
     * 自定义的生成方案类型
     */
    @Override
    public String getType() {
        return "tinyid";
    }

    /**
     * 核心方法-生成主键ID
     */
    @Override
    public Comparable<?> generateKey() {

//        Long id = TinyId.nextId("order");

        return "";
    }

    @Override
    public Properties getProperties() {
        return null;
    }

    @Override
    public void setProperties(Properties properties) {

    }
}
