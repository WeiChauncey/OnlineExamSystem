package com.weicx.dao;

import com.weicx.domain.History;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author weicx
 * @create 2021-10-14 18:53
 */
public interface IHistoryDao {

    /**
     * 固定出题试卷，获取用户userId 作答试卷eid 的历史记录
     * @param userId
     * @param eid
     * @return
     */
    @Select("select * from history where  uid = #{userId} and eid = #{eid} ORDER BY submit_time DESC ")
    List<History> findByQuizId(@Param("userId")String userId, @Param("eid") String eid);

    /**
     * 随机出题试卷，先通过用户userId 和试卷eid获得随机试卷ID，再获取随机试卷ID的历史记录
     * @param userId
     * @param eid
     * @return
     */
    @Select("select * from history where uid = #{userId} and eid in ( select auto_eid from user_quiz where uid = #{userId} and eid = #{eid}) ORDER BY submit_time DESC ")
    List<History> findRandomQuizById(@Param("userId")String userId, @Param("eid")String eid);
}
