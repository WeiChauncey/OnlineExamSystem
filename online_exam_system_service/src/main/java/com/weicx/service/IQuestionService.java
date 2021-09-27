package com.weicx.service;

import com.weicx.domain.*;

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

    List<Question_lib> findByStation(String station_id, int page, int size) throws Exception;

    //查询所有的试题类型
    List<Question_type> findQuestionTypeAll( ) throws Exception;

    //根据试题id查答案
    List<Options> findAnswerByQuestionId(String questionLibId) throws Exception;

    //根据试题id查选项
    List<Options> findByQuestionId(String questionLibId) throws Exception;

    //根据试题id查图片
    List<Question_img> findImageByQuestionId(String questionLibId) throws Exception;
}
