package com.weicx.dao;

import com.weicx.domain.Options;
import com.weicx.domain.Question_img;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author weicx
 * @create 2021-09-27 14:12
 * 与选项相关表：options
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

    @Delete("DELETE FROM options WHERE qid=#{qid}")
    void delteOptionByQid(String qid) throws Exception;


    @Insert("INSERT INTO options VALUES (#{qid},#{option},#{optionid},#{is_img},#{img_width},#{img_height})")
    void saveOption(Options option) throws Exception;

    /**
     * 通过随机试卷ID，获取随机试题的所有qid，通过qid试题选项信息
     * @param autoEid
     * @return
     * @throws Exception
     */
    @Select("select * from Options where qid in (select qid from questions where eid = #{quizId})")
    List<Options> findByQuizAutoId(String autoEid) throws Exception;
}
