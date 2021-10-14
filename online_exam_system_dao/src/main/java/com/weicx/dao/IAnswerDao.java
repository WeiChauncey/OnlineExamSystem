package com.weicx.dao;

import org.apache.ibatis.annotations.Delete;

/**
 * @author weicx
 * @create 2021-10-13 11:07
 */
public interface IAnswerDao {


    @Delete("delete from answer where qid= #{questionLibId}")
    void deleteAnswerByQid(String questionLibId) throws  Exception;
}
