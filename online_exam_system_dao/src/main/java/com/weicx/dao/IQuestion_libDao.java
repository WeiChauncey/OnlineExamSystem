package com.weicx.dao;/**
 * @author weicx
 * @create 2021-09-12 20:06
 */

import com.weicx.domain.Answer;
import com.weicx.domain.Options;
import com.weicx.domain.Question_lib;
import com.weicx.domain.Quiz;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @ClassName IQuestion_libDao
 * @Description 试题库Dao
 * @Author weicx
 * @date 20:06
 * @Version 1.0
 */
public interface IQuestion_libDao {

    //查询所有的试题，解决一对一问题
    @Select("select * from Question_lib ")
    @Results({
            @Result(id = true, column = "qid", property = "qid"),
            @Result(column = "station", property = "station", one = @One(select = "com.weicx.dao.IStationDao.findById")),
            @Result(column = "qtype", property = "qtype", one = @One(select = "com.weicx.dao.IQuestion_typeDao.findById")),
            @Result(column = "owner", property = "owner", one = @One(select = "com.weicx.dao.IUsersDao.findById"))

    })
    List<Question_lib> findAll() throws Exception;

    //多表操作
    @Select("select * from Question_lib where qid = #{questionLibId}")
    @Results({
            @Result(id = true, column = "qid", property = "qid"),
            @Result(column = "station", property = "station", one = @One(select = "com.weicx.dao.IStationDao.findById")),
            @Result(column = "qtype", property = "qtype", one = @One(select = "com.weicx.dao.IQuestion_typeDao.findById")),
            @Result(column = "owner", property = "owner", one = @One(select = "com.weicx.dao.IUsersDao.findById")),
            @Result(column = "qid", property = "Quizs", many = @Many(select = "com.weicx.dao.IQuizDao.findByQuestionLibId")),


    })
    Question_lib findById(String questionLibId) throws Exception;

//    /**
//     * 通过试卷ID，获取试题集合
//     * @param quizId
//     * @return
//     * @throws Exception
//     */
//    @Select("select * from Question_lib where qid in (select qid from quiz where eid = #{quizId})")
//    List<Question_lib> findByQuizId(String quizId) throws Exception;


    /**
     * 通过随机试卷ID,查找试题
     * @param quizId
     * @return
     * @throws Exception
     */
    @Select("select * from Question_lib where qid in (select qid from questions where eid = #{quizId})")
    List<Question_lib> findByQuizAutoId(String quizId) throws Exception;


    @Select("select * from Question_lib where station = #{station_id}")
    @Results({
            @Result(id = true, column = "qid", property = "qid"),
            @Result(column = "station", property = "station", one = @One(select = "com.weicx.dao.IStationDao.findById")),
            @Result(column = "qtype", property = "qtype", one = @One(select = "com.weicx.dao.IQuestion_typeDao.findById")),
            @Result(column = "owner", property = "owner", one = @One(select = "com.weicx.dao.IUsersDao.findById")),
            @Result(column = "qid", property = "Quizs", many = @Many(select = "com.weicx.dao.IQuizDao.findByQuestionLibId")),

    })
    List<Question_lib> findByStation(String station_id) throws Exception;

    @Update("UPDATE question_lib SET qns= #{qns} ,qtype=#{qtype} ,score=#{qscore}  WHERE qid=#{qid} ")
    void updateQuestion(@Param("qid")String qid, @Param("qns") String qns, @Param("qtype") Integer qtid, @Param("qscore") String qscore) throws Exception;

    @Select("select distinct filename from Question_lib where station = #{station_id}")
    List<String> findFileNameByStation(String station_id) throws Exception;

    @Select("select distinct score filename from Question_lib where station = #{station_id}")
    List<Integer> findScoreByStation(String station_id) throws Exception;

    @Select("select * from Question_lib where station = #{station}  and  qtype = #{qtype}   and  score = #{score}    and  filename = #{filename} ")
    @Results({
            @Result(id = true, column = "qid", property = "qid"),
            @Result(column = "station", property = "station", one = @One(select = "com.weicx.dao.IStationDao.findById")),
            @Result(column = "qtype", property = "qtype", one = @One(select = "com.weicx.dao.IQuestion_typeDao.findById")),
            @Result(column = "owner", property = "owner", one = @One(select = "com.weicx.dao.IUsersDao.findById")),
            @Result(column = "qid", property = "Quizs", many = @Many(select = "com.weicx.dao.IQuizDao.findByQuestionLibId")),

    })
    List<Question_lib> findBySearch(@Param("station")String station_id, @Param("qtype") Integer qtype, @Param("score") Integer score, @Param("filename") String from) throws Exception;

    @Delete("delete from question_lib where qid=#{qid}")
    void deleteByQid(String qid) throws Exception;
}
