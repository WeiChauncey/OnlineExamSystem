package com.weicx.dao;

import com.weicx.domain.Question_type;
import com.weicx.domain.Quiz_type;
import org.apache.ibatis.annotations.Select;

/**
 * @author weicx
 * @create 2021-09-13 17:14
 */
public interface IQuiz_typeDao {

    @Select("select * from Quiz_type where id = #{id}")
    Quiz_type findById(String id) throws Exception;
}
