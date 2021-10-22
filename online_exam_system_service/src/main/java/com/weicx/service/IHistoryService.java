package com.weicx.service;


import com.weicx.service.tx.HistoryService.HistoryOut;

import java.util.List;

/**
 * @author weicx
 * @create 2021-10-21 11:24
 */
public interface IHistoryService {
    List<HistoryOut> findExamByUser(String username) throws Exception;

    String deleteHistoryById(Integer hid) throws Exception;
}
