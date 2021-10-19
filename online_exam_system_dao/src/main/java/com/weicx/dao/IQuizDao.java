package com.weicx.dao;

import com.weicx.domain.Quiz;
import com.weicx.domain.Quiz_rules;
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
    @Select("select * from quiz where eid in (select eid from questions where qid = #{questionLibId})")
    List<Quiz> findByQuestionLibId(String questionLibId) throws Exception;

    /**
     * 通过试卷ID，查看试题
     * @param quizId
     * @return
     */
    @Select("select * from quiz  where eid = #{quizId}")
    @Results({
            @Result(id = true, column = "eid", property = "eid"),
            @Result(column = "station_id", property = "station", one = @One(select = "com.weicx.dao.IStationDao.findById")),
            @Result(column = "owner", property = "owner", one = @One(select = "com.weicx.dao.IUsersDao.findById")),
            @Result(column = "eid", property = "Question_libs", many = @Many(select = "com.weicx.dao.IQuestion_libDao.findByQuizId")),

    })
    Quiz findById(String quizId);

    /**
     * 通过试卷Id找到随机试卷Id
     * @param usersid
     * @param quizId
     * @return
     */
    @Select("select auto_eid from user_quiz  where uid = #{usersid} and eid = #{quizId}")
    String  findAutoQuizId(@Param("usersid") String usersid ,@Param("quizId") String quizId) throws Exception;

    /**
     * 通过UserName获取对用岗位user_stations，找到对应的试卷
     * @param userId
     * @return
     */
    @Select("select * from quiz where station_id in (select station from user_stations where uid = #{userId})")
    @Results({
            @Result(id = true, column = "eid", property = "eid"),
            @Result(column = "station_id", property = "station", one = @One(select = "com.weicx.dao.IStationDao.findById")),
            @Result(column = "owner", property = "owner", one = @One(select = "com.weicx.dao.IUsersDao.findById")),

    })
    List<Quiz> findExamByUser(String userId) throws Exception;

    /**
     * 通过Uid 和Eid获取随机试卷id
     * @param userId
     * @param eid
     * @return
     */
//    @Select("select auto_eid from user_quiz where uid = #{userId} and eid = #{eid}")
//    List<String>  findRandomQuiz(@Param("userId")String userId,@Param("eid") String eid ) throws Exception;


}
