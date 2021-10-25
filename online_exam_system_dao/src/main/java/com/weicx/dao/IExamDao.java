package com.weicx.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author weicx
 * @create 2021-10-15 17:07
 * 与考试相关的表操作：user_quiz、questions、answer
 */
public interface IExamDao {

    @Insert("INSERT INTO answer VALUES (#{qid},#{ansid})")
    void saveAnswer(@Param("qid")String qid,@Param("ansid") String optionUUid) throws Exception;

    /**
     * 通过试卷Id找到随机试卷Id
     * 同一人可能做多次随机试卷
     * @param quizId
     * @return
     */
    @Select("select auto_eid from user_quiz  where  eid = #{quizId}")
    List<String>  findAutoQuizIdByEid(@Param("quizId") String quizId) throws Exception;

    /**
     * 通过随机试卷Id试卷Id找到
     * @param usersid
     * @param quizId
     * @return
     */
    @Select("select eid from user_quiz  where uid = #{usersid} and auto_eid = #{quizId}")
    String  findQuizByAutoIdUid(@Param("usersid") String usersid ,@Param("quizId") String quizId) throws Exception;

    /**
     * 通过随机试卷Id试卷Id找到
     * @param quizId
     * @return
     */
    @Select("select eid from user_quiz  where  auto_eid = #{quizId}")
    String  findQuizByAutoId(@Param("quizId") String quizId) throws Exception;

    @Insert("INSERT INTO user_quiz(uid,eid,auto_eid) VALUES (#{uid},#{eid},#{auto_eid })")
    void saveUserQuiz(@Param("uid") String uid, @Param("eid")String eid, @Param("auto_eid") String auto_eid) throws Exception;

    @Insert("insert into questions VALUES (#{eid},#{qid}) ")
    void insertQuestion(@Param("eid")String eid, @Param("qid") String qid) throws Exception;

    @Delete("delete from answer where qid= #{questionLibId}")
    void deleteAnswerByQid(String questionLibId) throws  Exception;

    @Delete("DELETE FROM questions WHERE eid=#{eid}")
    void deleteQuestionByEid(String eid) throws Exception;

    @Delete("DELETE FROM user_quiz WHERE  eid=#{eid}")
    void deleteUserQuizByEid(String eid) throws Exception;
}
