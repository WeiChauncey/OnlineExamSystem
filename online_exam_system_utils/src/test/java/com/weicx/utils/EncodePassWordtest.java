package com.weicx.utils;/**
 * @author weicx
 * @create 2021-09-12 18:57
 */

import org.junit.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * @ClassName UUIDtest
 * @Description TODO
 * @Author weicx
 * @date 18:57
 * @Version 1.0
 */
public class EncodePassWordtest {
    @Test
    public void EncodePassWordtest(){
        System.out.println(BCryptPasswordEncoderUtils.encodePassWord("123"));
        //$2a$10$HktjX7mOQqEDnYACSaoleeyH80pzBSB239ef0GdZe4fCJBa9YYWFG



    }
}
