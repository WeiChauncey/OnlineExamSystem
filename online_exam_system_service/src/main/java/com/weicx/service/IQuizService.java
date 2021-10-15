package com.weicx.service;

import com.weicx.domain.Quiz;

import java.util.List;

/**
 * @author weicx
 * @create 2021-09-12 14:33
 * 试卷业务接口
 */
public interface IQuizService {

    //查询所有的试卷
    List<Quiz> findAll() throws Exception;

    void save(Quiz quiz) throws Exception;

    /**
     * 通过试卷ID，查看试题
     */
    Quiz findById(String quizId) throws Exception;

    /**
     * 通过用户名，找到待考试试卷
     * @param username
     * @return
     * @throws Exception
     */
    List<Quiz> findExamByUser(String username) throws Exception;
}
