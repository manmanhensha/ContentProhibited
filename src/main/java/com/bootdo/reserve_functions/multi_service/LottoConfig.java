//package com.bootdo.reserve_functions.multi_service;
//
//import com.google.common.collect.Maps;
//import com.yonyou.cdp.lottery.lotto.enums.LottoType;
//import com.yonyou.cdp.lottery.lotto.service.LottoService;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//
//import java.util.Map;
//
///**
// * 自定义多个service映射
// */
//@Configuration
//public class LottoConfig {
//
//    @Bean(value = "lottoServiceMap")
//    public Map<LottoType, LottoService> initLottoService(@Qualifier(value = "orderLottoService") LottoService orderLottoService,
//                                                         @Qualifier(value = "randomLottoService") LottoService randomLottoService,
//                                                         @Qualifier(value = "fishLottoService") LottoService fishLottoService) {
//        Map<LottoType, LottoService> lottoServiceMap = Maps.newEnumMap(LottoType.class);
//        lottoServiceMap.put(LottoType.ORDER, orderLottoService);
//        lottoServiceMap.put(LottoType.RANDOM, randomLottoService);
//        lottoServiceMap.put(LottoType.FISH, fishLottoService);
//        return lottoServiceMap;
//    }
//
//
//}
