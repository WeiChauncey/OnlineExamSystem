package com.weicx.dao;

import com.weicx.domain.Options;
import com.weicx.domain.Question_lib;
import com.weicx.domain.Quiz_rules;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author weicx
 * @create 2021-10-15 17:07
 */
public interface IExamDao {

    /**
     * 通过试卷ID获取随机出题规则
     * @param eid
     */
    @Select("select * from Quiz_rules where  eid = #{eid}")
    List<Quiz_rules>   findQuizRuleByEid(String eid) throws Exception;

    @Insert("INSERT INTO user_quiz(uid,eid,auto_eid) VALUES (#{uid},#{eid},#{auto_eid })")
    void saveUserQuiz(@Param("uid") String uid, @Param("eid")String eid, @Param("auto_eid") String auto_eid) throws Exception;

    @Insert("insert into questions VALUES (#{eid},#{qid}) ")
    void insertQuestion(@Param("eid")String eid, @Param("qid") String qid) throws Exception;

    @Delete("delete from answer where qid= #{questionLibId}")
    void deleteAnswerByQid(String questionLibId) throws  Exception;


}
