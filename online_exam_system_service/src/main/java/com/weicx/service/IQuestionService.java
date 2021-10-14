package com.weicx.service;

import com.weicx.domain.*;
import com.weicx.service.tx.QuestionService.QuestionOut;

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

    //修改试题
//    String questionModify(String qid, String qns, Integer qtid, String qscore, Integer img_cnt, String imgPath, Integer imgw, Integer imgh) throws Exception;

    //修改试题
    String questionModify(String qid, String qns, Integer qtid, String qscore, Integer img_cnt, String imgPath, Integer imgw, Integer imgh, List<Options> optionsList, String[] answerList) throws Exception;

    //通过岗位ID，获取不同的试题类型、文件名、分数
    QuestionOut initData(String station_id) throws Exception;

    List<Question_lib> findBySearch(String station_id, Integer qtype, Integer score, String from) throws Exception;

    String deleteById(String questionLibId) throws Exception;
}
