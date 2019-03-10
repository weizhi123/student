package com.jlkj.wz.util;

/**
 * @Auther:
 * @Date: 2019/3/10 19:18
 * @Description:
 */
import org.apache.commons.lang3.StringUtils;

public class DictUtils {

    public DictUtils() {
    }
    public static String getDictLabel(String value, String type, String defaultValue) {
        if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(value)) {
            return defaultValue;
        }else{
            return "我也不知道该写点什么";
        }
        //return defaultValue;
    }
}
