package com.bootdo.reserve_functions.策略模式;

import com.yonyou.jbrand.api.document.global.dto.out.BaseOutDTO;
import com.yonyou.jbrand.api.document.internal.objects.dto.in.ObjectUploadInDTO;
import com.yonyou.jbrand.api.document.internal.objects.dto.out.ObjectUploadOutDTO;

import java.util.List;

public interface ObjectsBiz {

    BaseOutDTO<String> createFolder(String bucketName, String folderName);

    BaseOutDTO<ObjectUploadOutDTO> upload(ObjectUploadInDTO inDTO);

    BaseOutDTO<List<ObjectUploadOutDTO>> batchUpload(List<ObjectUploadInDTO> inDTO);

}
