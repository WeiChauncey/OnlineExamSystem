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

    @Delete("delete from question_img where qid=#{qid}")
    void delteImgByQuestionId(String qid) throws Exception;

    @Insert("INSERT INTO question_img VALUES (#{qid},#{img_path},#{img_width},#{img_height})")
    void saveImgByQuestionId(@Param("qid")String qid,@Param("img_path") String imgPath, @Param("img_width")Integer imgw,@Param("img_height") Integer imgh) throws Exception;

    @Delete("DELETE FROM options WHERE qid=#{qid}")
    void delteOptionByQid(String qid) throws Exception;

    @Delete("delete from answer where qid=#{qid}")
    void delteAnswerByQid(String qid) throws Exception;

    @Insert("INSERT INTO answer VALUES (#{qid},#{$ansid})")
    void saveAnswer(@Param("qid")String qid,@Param("$ansid") String optionUUid) throws Exception;

    @Insert("INSERT INTO options VALUES (#{qid},#{option},#{optionid},#{is_img},#{img_width},#{img_height})")
    void saveOption(Options option) throws Exception;
}
