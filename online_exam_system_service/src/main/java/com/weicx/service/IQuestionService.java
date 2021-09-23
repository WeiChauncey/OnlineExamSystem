package com.weicx.service;

import com.weicx.domain.Question_lib;

import java.util.List;

/**
 * @author weicx
 * @create 2021-09-12 20:11
 */
public interface IQuestionService {

    //查询所有的试题
    List<Question_lib> findAll(int page, int size) throws Exception;

    //查询所有的试题
    Question_lib findById(String questionLibId ) throws Exception;
}
