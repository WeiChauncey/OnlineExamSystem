package com.weicx.dao;

import com.weicx.domain.Quiz;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author weicx
 * @create 2021-09-12 14:26
 * 试卷持久层接口
 */
public interface IQuizDao {

    //查询所有的试卷
    @Select("select * from quiz ")
    @Results({
            @Result(id = true, column = "eid", property = "eid"),
            @Result(column = "station_id", property = "station", one = @One(select = "com.weicx.dao.IStationDao.findById")),
            @Result(column = "owner", property = "owner", one = @One(select = "com.weicx.dao.IUsersDao.findById")),
            @Result(column = "type", property = "type", one = @One(select = "com.weicx.dao.IQuiz_typeDao.findById")),

    })
    List<Quiz> findAll() throws Exception;

//    @Insert("INSERT INTO quiz(eid,title,station_id,time,type,owner,pass_score,is_random,retry)\n" +
//            "            VALUE(#{eid},#{title},#{station_id},#{time},#{type},#{owner},#{pass_score},#{is_random},#{retry}) " )
    void save(Quiz quiz);

    /**
     * IQuestion_LibDao多表查询的方法:
     * 1、通过questionLibId 在中间表question中查出QuizId
     * 2、通过QuizId 在Quiz表查询信息
     * @param questionLibId
     * @return
     * @throws Exception
     */
    @Select("select * from quiz where eid in (select eid from question where qid = #{questionLibId})")
    List<Quiz> findByQuestionLibId(String questionLibId) throws Exception;

//    /**
//     * 通过试卷ID，查看试题
//     * @param quizId
//     * @return
//     */
//    @Select("select * from quiz  where eid = #{quizId}")
//    @Results({
//            @Result(id = true, column = "eid", property = "eid"),
//            @Result(column = "station_id", property = "station", one = @One(select = "com.weicx.dao.IStationDao.findById")),
//            @Result(column = "owner", property = "owner", one = @One(select = "com.weicx.dao.IUsersDao.findById")),
//            @Result(column = "type", property = "type", one = @One(select = "com.weicx.dao.IQuiz_typeDao.findById")),
//            @Result(column = "eid", property = "Question_libs", many = @Many(select = "com.weicx.dao.IQuestion_libDao.findByQuizId")),
//
//    })
//    Quiz findById(String quizId);

    /**
     * 通过试卷Id找到随机试卷Id
     * @param usersid
     * @param quizId
     * @return
     */
    @Select("select auto_eid from user_quiz  where uid = #{usersid} and eid = #{quizId}")
    String  findAutoQuizId(@Param("usersid") String usersid ,@Param("quizId") String quizId);
}
