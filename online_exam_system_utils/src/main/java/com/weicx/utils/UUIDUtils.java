package com.weicx.utils;/**
 * @author weicx
 * @create 2021-09-12 18:49
 */

import java.util.UUID;

/**
 * @ClassName UUIdGenId
 * @Description TODO
 * @Author weicx
 * @date 18:49
 * @Version 1.0
 */
public class UUIDUtils {

    /**
     * 生成唯一UUID
     * @return
     */
    public static String getUUID32() {
        return UUID.randomUUID().toString().replace("-","");
    }

    /**
     * 生成指定数量的UUID，以数组的方式返回
     * @param num
     * @return
     */
    public static String[] getUUID(int num) {
        if (num <= 0)
            return null;
        String[] uuidArr = new String[num];
        for (int i = 0; i < uuidArr.length; i++) {
            uuidArr[i] = getUUID32();
        }
        return uuidArr;
    }

    public static String[] chars = new String[] { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o",
            "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
            "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U",
            "V", "W", "X", "Y", "Z" };

    /**
     * 生成8位UUID
     * @return
     */
    public static  String generateUuid8() {
        StringBuffer shortBuffer = new StringBuffer();
        String uuid = UUID.randomUUID().toString().replace("-", "");
        for (int i = 0; i < 8; i++) {
            String str = uuid.substring(i * 4, i * 4 + 4);
            int x = Integer.parseInt(str, 16);
            shortBuffer.append(chars[x % 0x3E]);
        }
        return shortBuffer.toString();

    }
}
