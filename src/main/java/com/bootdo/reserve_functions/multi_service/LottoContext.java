//package com.bootdo.reserve_functions.multi_service;
//
//import com.yonyou.cdp.lottery.common.BaseServiceError;
//import com.yonyou.cdp.lottery.common.LottoException;
//import com.yonyou.cdp.lottery.common.enums.DeleteStatus;
//import com.yonyou.cdp.lottery.lotto.enums.LottoType;
//import com.yonyou.cdp.lottery.lotto.po.LottoPO;
//import com.yonyou.cdp.lottery.lotto.repo.LottoRepository;
//import com.yonyou.cdp.lottery.lotto.service.LottoService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//
//import java.util.Map;
//import java.util.Optional;
//
//@Component
//public class LottoContext {
//
//    @Autowired
//    private LottoRepository lottoRepository;
//
//    @Autowired
//    private Map<LottoType, LottoService> lottoServiceMap;
//
//    public LottoService getLottoService(Long lottoId) {
//        return lottoServiceMap.get(getLottoPO(lottoId).getType());
//    }
//
//    public LottoService getLottoService(LottoType type) {
//        return lottoServiceMap.get(type);
//    }
//
//    private LottoPO getLottoPO(Long lottoId) {
//        Optional<LottoPO> optional = lottoRepository.findById(lottoId);
//        if (!optional.isPresent() || DeleteStatus.TRUE.equals(optional.get().getDeleteStatus())) {
//            throw new LottoException(BaseServiceError.PARAM_ERROR.getCode(), "lotto not exist");
//        }
//        return optional.get();
//    }
//}
