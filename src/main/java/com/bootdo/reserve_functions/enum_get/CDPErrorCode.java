package com.bootdo.reserve_functions.enum_get;

import java.util.Arrays;
import java.util.Optional;

/**
 * @author wushiqiang
 * @date Created in 11:13 2019/11/14
 * @description CDP返回异常信息，及描述
 * @modified By
 */
public enum CDPErrorCode {

	CDP_ERROR_CODE1("CDP.VEHICLE.0004", "车辆已存在绑定关系"),
	CDP_ERROR_CODE2("CDP.VEHICLE.0076", "记录已被审核"),
	CDP_ERROR_CODE3("CDP.VEHICLE.0002", "车辆不存在"),
	CDP_ERROR_CODE4("CDP.VEHICLE.0005", "与车主证件号不一致"),
	CDP_ERROR_CODE5("CDP.VEHICLE.0006", "有其他用户绑定审核信息记录"),
	CDP_ERROR_CODE6("CDP.VEHICLE.0014", "车辆合同不存在"),
	CDP_ERROR_CODE7("CDP.VEHICLE.0049", "车主关系检查失败"),
	CDP_ERROR_CODE8("CDP.VEHICLE.0056", "车辆信息修改审核记录已被处理"),
	CDP_ERROR_CODE9("CDP.VEHICLE.0057", "车辆信息修改审核记录不存在"),
	CDP_ERROR_CODE10("CDP.VEHICLE.0058", "车辆信息修改审核记录已存在"),
	CDP_ERROR_CODE11("CDP.VEHICLE.0059", "绑车超过限制"),
	CDP_ERROR_CODE12("CDP.VEHICLE.0060", "调用第三方服务异常"),
	CDP_ERROR_CODE13("CDP.VEHICLE.0094", "证件类型错误"),

	;

	private final String code;
	private final String dec;

	CDPErrorCode(String code, String dec) {
		this.code = code;
		this.dec = dec;
	}

	public String getCode() {
		return code;
	}

	public String getDec() {
		return dec;
	}

	/**
	 * 根据code取出值value
	 */
	public static String getDecValue(String code) {
		Optional<CDPErrorCode> codeOptional = Arrays.stream(CDPErrorCode.values()).filter(cdpErrorCode -> code.equals(cdpErrorCode.code)).findFirst();
		if (codeOptional.isPresent()) {
			return codeOptional.get().getDec();
		}
		return "查询失败";
	}

	/**
	 * 根据值value取出code
	 */
	public static String getCodeValue(String dec) {
		Optional<CDPErrorCode> codeOptional = Arrays.stream(CDPErrorCode.values()).filter(cdpErrorCode -> dec.equals(cdpErrorCode.dec)).findFirst();
		if (codeOptional.isPresent()) {
			return codeOptional.get().getCode();
		}
		return "查询失败";
	}

	public static CDPErrorCode isConform(String code) {
		for (CDPErrorCode value : CDPErrorCode.values()) {
			if (value.getCode().equals(code)) {
				return value;
			}
		}
		return null;
	}

}
