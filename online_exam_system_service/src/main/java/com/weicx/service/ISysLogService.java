package com.weicx.service;

import com.weicx.domain.SysLog;

import java.util.List;

/**
 * @author weicx
 * @create 2021-09-25 19:42
 */
public interface ISysLogService {
    void save(SysLog sysLog) throws Exception;

    List<SysLog> findAll() throws Exception;;
}
