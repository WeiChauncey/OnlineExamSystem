package com.weicx.service.impl;/**
 * @author weicx
 * @create 2021-09-25 19:44
 */

import com.weicx.dao.ISysLogDao;
import com.weicx.domain.SysLog;
import com.weicx.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @ClassName SysLogService
 * @Description TODO
 * @Author weicx
 * @date 19:44
 * @Version 1.0
 */
@Service
@Transactional
public class SysLogService implements ISysLogService {

    @Autowired
    private ISysLogDao sysLogDao;

    @Override
    public void save(SysLog sysLog) throws Exception {
        sysLogDao.save(sysLog);
    }

    @Override
    public List<SysLog> findAll() throws Exception {
        return sysLogDao.findAll();
    }
}
