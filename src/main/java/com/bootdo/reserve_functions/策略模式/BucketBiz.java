//package com.bootdo.reserve_functions.策略模式;
//
//import com.yonyou.jbrand.api.document.global.dto.out.BaseOutDTO;
//import com.yonyou.jbrand.api.document.internal.bucket.dto.in.BucketCreateInDTO;
//import com.yonyou.jbrand.api.document.internal.bucket.dto.out.BucketExistOutDTO;
//import com.yonyou.jbrand.api.document.internal.bucket.dto.out.BucketListOutDTO;
//
//import java.util.List;
//
//public interface BucketBiz {
//
//    BaseOutDTO create(BucketCreateInDTO inDTO);
//
//    BaseOutDTO delete(String bucketName);
//
//    BaseOutDTO<BucketExistOutDTO> exist(String bucketName);
//
//    BaseOutDTO<List<BucketListOutDTO>> list();
//
//
//}
