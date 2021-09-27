package com.weicx.dao;

import com.weicx.domain.Question_type;
import com.weicx.domain.Station;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author weicx
 * @create 2021-09-13 16:34
 */
public interface IQuestion_typeDao {

    @Select("select * from question_type where qtid = #{id}")
    Question_type findById(String id) throws Exception;

    @Select("select * from Question_type ")
    List<Question_type> findAll() throws Exception;
}
