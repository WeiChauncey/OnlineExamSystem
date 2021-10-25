package com.weicx.dao;

import com.weicx.domain.History;
import com.weicx.domain.History_answers;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author weicx
 * @create 2021-10-14 18:53
 * 与历史相关表：history、history_answers、history_record
 */
public interface IHistoryDao {

    /**
     * 固定出题试卷，获取用户userId 作答试卷eid 的历史记录
     * @param userId
     * @param eid
     * @return
     */
    @Select("select * from history where  uid = #{userId} and eid = #{eid} ORDER BY submit_time DESC ")
    List<History> findByQuizId(@Param("userId")String userId, @Param("eid") String eid)  throws Exception;

    /**
     * 随机出题试卷，先通过用户userId 和试卷eid获得随机试卷ID，再获取随机试卷ID的历史记录
     * @param userId
     * @param eid
     * @return
     */
    @Select("select * from history where uid = #{userId} and eid in ( select auto_eid from user_quiz where uid = #{userId} and eid = #{eid}) ORDER BY submit_time DESC ")
    List<History> findRandomQuizById(@Param("userId")String userId, @Param("eid")String eid)  throws Exception;

    @Select("SELECT submit_time  FROM history  where uid=#{uid} ORDER BY submit_time DESC LIMIT 1 ")
    Integer  findLatestQuiz(String uid)  throws Exception;

    @Insert("INSERT INTO history (uid,eid,score,start_time,submit_time) VALUES (#{uid},#{eid},#{score},#{start_time},#{start_time})")
    void insertHistory(@Param("uid")String uid, @Param("eid")String eid,@Param("score")Integer score,@Param("start_time")long start_time)  throws Exception;

    /**
     * 获取历史表的id
     * @param uid
     * @param autoEid
     * @return
     * @throws Exception
     */
    @Select("SELECT id  FROM history  where uid=#{uid} and eid = #{eid} ORDER BY submit_time   LIMIT 1 ")
    Integer findByUidAutoEid(@Param("uid") String uid, @Param("eid") String autoEid) throws Exception;

    /**
     * 获取历史表的id
     * @param autoEid
     * @return
     * @throws Exception
     */
    @Select("SELECT id  FROM history  where eid = #{eid} ORDER BY submit_time   LIMIT 1 ")
    Integer findByAutoEid(String autoEid) throws Exception;


    /**
     * 将填空题的答案写入到history_answers
     * @param hid
     * @param qid
     * @param answer
     * @param score
     * @throws Exception
     */
    @Insert("INSERT INTO history_answers (hid,qid,answer,score) VALUES (#{hid},#{qid},#{answer},#{score})")
    void addHistoryAnswer(@Param("hid") Integer hid,@Param("qid") String qid,@Param("answer")  String answer,@Param("score")  Integer score) throws Exception;

    /**
     * 考生答题期间，定时更新历史的提交时间
     * @param hid
     * @param submit_time
     */
    @Update("UPDATE history SET submit_time = #{submit_time} WHERE id= #{hid}")
    void updateSubmitTime(@Param("hid") Integer hid, @Param("submit_time") long submit_time) throws Exception;

    @Insert("REPLACE INTO history_record(hid,qid,is_pass)  VALUES(#{hid},#{qid},#{is_pass})")
    void addHistoryRecord(@Param("hid") Integer hid,@Param("qid") String qid, @Param("is_pass") int is_pass) throws Exception;

    @Insert("UPDATE history   SET score=#{score}  WHERE id= #{hid}")
    void updateHistoryInfo(@Param("hid") Integer hid,@Param("score") Integer score) throws Exception;

    /**
     * 通过hid查询最后一条历史记录
     * @param hid
     * @return
     * @throws Exception
     */
    @Select("SELECT *  FROM history  where id=#{hid} ORDER BY id DESC LIMIT 1 ")
    History  findLastHistoryByUid(Integer hid) throws Exception;

    @Select("SELECT *  FROM history  where uid=#{userId} ORDER BY submit_time DESC ")
    List<History> findAllByUid(String userId) throws Exception;

    @Select("SELECT *  FROM history_answers  where hid=#{hid} ")
    List<History_answers> findHistoryAnswerByHid(Integer hid) throws Exception;

    @Delete("delete from history_answers where hid=#{hid}")
    void deleteAnswerByHid(Integer hid);

    @Delete("delete from history_record where hid=#{hid}")
    void deleteRecordByHid(Integer hid);

    @Delete("delete from history where id=#{hid}")
    void deleteHistoryByHid(Integer hid);


}
