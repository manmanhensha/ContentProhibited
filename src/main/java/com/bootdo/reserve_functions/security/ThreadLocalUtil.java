package com.bootdo.reserve_functions.security;

import java.util.HashMap;
import java.util.Map;

/**
 * @program: itms-basic
 * @description:
 * @author: LHK
 * @create: 2022-08-31 15:05
 */

public class ThreadLocalUtil {
    private static final ThreadLocal<Map<String, String>> threadLocal = ThreadLocal.withInitial(() -> new HashMap<>(10));

    public static Map<String, String> getThreadLocal() {
        return threadLocal.get();
    }

    public static String get(String key) {
        Map<String, String> map = threadLocal.get();
        return map.get(key);
    }

    public static void set(String key, String value) {
        Map<String, String> map = threadLocal.get();
        map.put(key, value);
    }

    public static void set(Map<String, String> keyValueMap) {
        Map<String, String> map = threadLocal.get();
        map.putAll(keyValueMap);
    }

    public static void remove() {
        threadLocal.remove();
    }

    public static <T> T remove(String key) {
        Map<String, String> map = threadLocal.get();
        return (T) map.remove(key);
    }
}
