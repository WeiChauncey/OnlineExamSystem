package com.weicx.utils;
/**
 * @author weicx
 * @create 2021-10-14 18:28
 */

import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;

/**
 * @ClassName UserUtils
 * @Description 用户相关工具类
 * @Author weicx
 * @date 18:28
 * @Version 1.0
 */
public class UserUtils {

    public static String findUserName(){
        //获取当前操作的用户 ，通过springSecurity框架获得
        SecurityContext context = SecurityContextHolder.getContext(); //从上下文中获取当前用户
        User user = (User) context.getAuthentication().getPrincipal(); //获取springSecurity内部的user类
        String username = user.getUsername();
        return username;
    }

}
