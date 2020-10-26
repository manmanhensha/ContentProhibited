//package com.bootdo.reserve_functions.multi_service;
//
//import com.google.common.collect.Maps;
//import com.yonyou.cdp.lottery.lotto.enums.LottoType;
//import com.yonyou.cdp.lottery.rule.service.RuleService;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//
//import java.util.Map;
//
//@Configuration
//public class RuleConfig {
//
//    @Bean(value = "ruleServiceMap")
//    public Map<LottoType, RuleService> initRuleService(@Qualifier(value = "orderRuleService") RuleService orderRuleService,
//                                                        @Qualifier(value = "randomRuleService") RuleService randomRuleService,
//                                                        @Qualifier(value = "fishRuleService") RuleService fishRuleService) {
//        Map<LottoType, RuleService> ruleServiceMap = Maps.newEnumMap(LottoType.class);
//        ruleServiceMap.put(LottoType.ORDER, orderRuleService);
//        ruleServiceMap.put(LottoType.RANDOM, randomRuleService);
//        ruleServiceMap.put(LottoType.FISH, fishRuleService);
//        return ruleServiceMap;
//    }
//}
