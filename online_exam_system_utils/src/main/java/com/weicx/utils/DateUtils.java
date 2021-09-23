package com.weicx.utils;/**
 * @author weicx
 * @create 2021-09-12 16:39
 */

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @ClassName DateUtils
 * @Description TODO
 * @Author weicx
 * @date 16:39
 * @Version 1.0
 */
public class DateUtils {
    //日期转换成字符串
    public static String dateToString(Date date, String pattern){
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        return sdf.format(date);
    }

    //字符串转换成日期
    public static Date StringToDate(String str, String pattern) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        return sdf.parse(str);
    }
}
