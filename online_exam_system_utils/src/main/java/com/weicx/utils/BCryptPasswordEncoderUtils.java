package com.weicx.utils;/**
 * @author weicx
 * @create 2021-09-15 18:57
 */

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * @ClassName BCryptPasswordEncoderUtils
 * @Description  加密工具类：通过SpringSecurity对密码进行加密
 * @Author weicx
 * @date 18:57
 * @Version 1.0
 */
public class BCryptPasswordEncoderUtils {
    private static BCryptPasswordEncoder bCryptPasswordEncoder =  new BCryptPasswordEncoder();

    public static String encodePassWord(String password){
        return bCryptPasswordEncoder.encode(password);
    }


}
