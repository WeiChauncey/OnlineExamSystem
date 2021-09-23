package com.weicx.service;

import com.weicx.domain.Users;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

/**
 * @author weicx
 * @create 2021-09-14 14:30
 * 使用Spring Security框架，该相当于controller，继承spring Security中的类
 */
public interface IUserService extends UserDetailsService {
    List<Users> findAll() throws Exception;

    void save(Users userInfo) throws Exception;

    Users findById(String userId) throws Exception;

    void deleteUser(String userId) throws Exception;

    void modifyStationByUser(String userId, Integer[] oids, Integer[] pids, Integer[] mids) throws Exception;
}
