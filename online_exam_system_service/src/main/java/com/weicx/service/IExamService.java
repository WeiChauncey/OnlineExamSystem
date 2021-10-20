package com.weicx.service;

import com.weicx.domain.Quiz;
import com.weicx.service.tx.ExamServiceUtils.ExamOut;
import com.weicx.service.tx.ExamServiceUtils.ExamResultOut;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author weicx
 * @create 2021-10-15 17:03
 */
public interface IExamService {
    /**
     * 通过用户名，找到待考试试卷
     * @param username
     * @return
     * @throws Exception
     */
    List<Quiz> findExamByUser(String username) throws Exception;

    /**
     * 通过试卷Id，获取试卷内容
     * @param eid
     * @throws Exception
     */
    ExamOut examDetailById(String eid) throws Exception;

    /**
     * 自动提交试卷，保存非简答题答案
     * @param eid
     * @param hid
     * @param autoeid
     * @param request
     * @return
     * @throws Exception
     */
    String autoSubmit(String eid, Integer hid, String autoeid, HttpServletRequest request) throws Exception;

    ExamResultOut getExamResult(Integer hid) throws Exception;
}
