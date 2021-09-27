package com.weicx.dao;

import com.weicx.domain.Options;
import com.weicx.domain.Question_img;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author weicx
 * @create 2021-09-27 14:12
 * 选项相关操作，答案，图片
 */
public interface IOptionsDao {

    /**
     * 通过试题ID查询答案选项
     * @param questionLibId
     * @return
     * @throws Exception
     */
    @Select("select * from options where optionid in (select ansid from Answer where qid = #{questionLibId})")
    List<Options> findAnswerByQuestionId(String questionLibId) throws Exception;


    @Select("select * from options where  qid = #{questionLibId} ORDER BY optionid")
    List<Options> findByQuestionId(String questionLibId) throws Exception;

    @Select("SELECT * FROM question_img WHERE   qid = #{questionLibId} ")
    List<Question_img> findImageByQuestionId(String questionLibId) throws Exception;
}
