package com.bootdo.reserve_functions.�������������ӿڲ�������ֵ;

/**
 * @author wushiqiang
 * @date Created in 21:12 2022/3/31
 */
public class partitionCall2ListAsync {
//	@Autowired
//	private ContentCenterService contentCenterService;
//	@Autowired
//	private SubscribeMessageSendLogMapper sendLogMapper;
//
//	ExecutorService executorService = Executors.newFixedThreadPool(10);
//
//	private AtomicInteger atomicInteger = new AtomicInteger(0);
//
//	private int total = 30;
//
//	@Override
//	public void sendSubscribeMessageToUser() {
//		final LambdaQueryWrapper<SubscribeMessageDO> wrapper = new LambdaQueryWrapper<>();
////		ÿ�δ����ݿ�ȡ1000
//		wrapper.eq(SubscribeMessageDO::getSendState, 2).eq(SubscribeMessageDO::getNoticeAllowanceFlag, 1).last("limit 1000");
//
//		final List<SubscribeMessageDO> doList = list(wrapper);
//		Stopwatch stopwatch = Stopwatch.createStarted();
//		// ����ִ��
//		int size = 3;
//		final List<SubscribeMessageSendVo> doList1 = partitionCall2ListAsync(doList, 3, executorService, this::someCall);
//		Stopwatch stop = stopwatch.stop();
//		System.err.println("ִ��ʱ��: "+stop.elapsed(TimeUnit.SECONDS)+" ��");
//
//		// ���ü���
//		int turns;
//		if (total % size == 0) {
//			turns = total / size;
//		} else {
//			turns = total / size + 1;
//		}
//		System.err.println("��������{}��: "+turns);
//
//		for (SubscribeMessageSendVo subscribeMessageSendVo : doList1) {
//			final SubscribeMessageDO subscribeMessageDO = subscribeMessageSendVo.getSubscribeMessageDO();
//			if (subscribeMessageSendVo.getCode() == 200 && subscribeMessageSendVo.getData().getErrcode() == 0) {
//				final UpdateWrapper<SubscribeMessageDO> updateWrapper = new UpdateWrapper<>();
//				updateWrapper.eq("id", subscribeMessageDO.getId()).set("send_state", 1).set("send_time", new Date());
//				update(updateWrapper);
//
//				final SubscribeMessageSendLogDO sendLogDO = new SubscribeMessageSendLogDO();
//				sendLogDO.setSubscribeMessageLogId(subscribeMessageDO.getId());
//				sendLogDO.setOpenid(subscribeMessageDO.getOpenid());
//				sendLogDO.setTemplateid(subscribeMessageDO.getTemplateid());
//				sendLogDO.setSendState(1);
//				sendLogDO.setCreatedTime(new Date());
//				sendLogMapper.insert(sendLogDO);
//			}
//		}
//	}

//	public static <T, V> List<V> partitionCall2ListAsync(List<T> dataList,
//														 int size,
//														 ExecutorService executorService,
//														 Function<List<T>, List<V>> function
//	) {
//		if (CollectionUtils.isEmpty(dataList)) {
//			return new ArrayList<>(0);
//		}
//		Preconditions.checkArgument(size > 0, "size must not be a minus");
//
//		List<CompletableFuture<List<V>>> completableFutures = Lists.partition(dataList, size)
//				.stream()
//				.map(eachList -> {
//					if (executorService == null) {
//						return CompletableFuture.supplyAsync(() -> function.apply(eachList));
//					} else {
//						return CompletableFuture.supplyAsync(() -> function.apply(eachList), executorService);
//					}
//				})
//				.collect(Collectors.toList());
//
//		CompletableFuture<Void> allFinished = CompletableFuture.allOf(completableFutures.toArray(new CompletableFuture[0]));
//		try {
//			allFinished.get();
//		} catch (Exception e) {
//			throw new RuntimeException(e);
//		}
//		return completableFutures.stream()
//				.map(CompletableFuture::join)
//				.filter(CollectionUtils::isNotEmpty)
//				.reduce(new ArrayList<V>(), ((list1, list2) -> {
//					List<V> resultList = new ArrayList<>();
//					if (CollectionUtils.isNotEmpty(list1)) {
//						resultList.addAll(list1);
//					}
//					if (CollectionUtils.isNotEmpty(list2)) {
//						resultList.addAll(list2);
//					}
//					return resultList;
//				}));
//	}

	/**
	 * ������������ӿڲ���ת�����Լ��Ķ���
	 * @param eachList ÿ�����������
	 * @return �����Լ��Ķ���
	 */
//	private List<SubscribeMessageSendVo> someCall(List<SubscribeMessageDO> eachList) {
//		log.info("��ǰ-->{}��strList.size��{}", atomicInteger.incrementAndGet(), eachList.size());
//
//		final List<SubscribeMessageSendVo> subscribeMessageSendVoList = new ArrayList<>();
//		for (SubscribeMessageDO subscribeMessageDO : eachList) {
//			final String miniprogramState = subscribeMessageDO.getMiniprogramState();
//			final String messageLang = subscribeMessageDO.getMessageLang();
//
//			SubscribeMessageSendParam param = new SubscribeMessageSendParam();
//			param.setToUser(subscribeMessageDO.getOpenid());
//			param.setTemplateId(subscribeMessageDO.getTemplateid());
//			param.setData(JSONObject.parseObject(subscribeMessageDO.getTemplateContent()));
//			param.setPage(subscribeMessageDO.getPage());
//			param.setMiniprogram_state(StrUtil.isBlank(miniprogramState) ? null : miniprogramState);
//			param.setLang(StrUtil.isBlank(messageLang) ? null : messageLang);
//
////			final int count = sendLogMapper.countByOpenidTemplateid(subscribeMessageDO.getOpenid(), subscribeMessageDO.getTemplateid());
////			if (count > 0) {
////				final UpdateWrapper<SubscribeMessageDO> updateWrapper = new UpdateWrapper<>();
////				updateWrapper.eq("id", subscribeMessageDO.getId()).set("send_state", 2);
////				update(updateWrapper);
////				continue;
////			}
//			String timestamp = System.currentTimeMillis() + "";
//			String nonce = SignUtil.randomHexString(16);
//			String signStr = JSON.toJSONString(param, SerializerFeature.WriteMapNullValue);
//			String sign = SignUtil.sign(signStr, timestamp, nonce, FeignConstants.App_Secret);
//
//			SubscribeMessageSendVo subscribeMessageSendVo = contentCenterService.subscribeMessageSend(FeignConstants.X_App_Key_Value, nonce, timestamp, sign, subscribeMessageDO.getAppid(), param);
//			subscribeMessageSendVo.setSubscribeMessageDO(subscribeMessageDO);
//			subscribeMessageSendVoList.add(subscribeMessageSendVo);
//		}
//
//		return subscribeMessageSendVoList;
//	}
}
