package com.bootdo.reserve_functions.future;

/**
 * @author wushiqiang
 * @date Created in 10:55 2022/2/24
 */
public interface Computable<A, V> {
	V compute(A arg) throws Exception;
}
