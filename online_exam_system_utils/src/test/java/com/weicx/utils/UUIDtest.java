package com.weicx.utils;/**
 * @author weicx
 * @create 2021-09-12 18:57
 */

import org.junit.Test;

/**
 * @ClassName UUIDtest
 * @Description UUID工具类测试
 * @Author weicx
 * @date 18:57
 * @Version 1.0
 */
public class UUIDtest {
    @Test
    public void uuidTest(){
        System.out.println(UUIDUtils.getUUID32());
        System.out.println("/n");
        System.out.println(UUIDUtils.getUUID(13));
        System.out.println("/n");
        System.out.println(UUIDUtils.generateUuid8());


    }
}
