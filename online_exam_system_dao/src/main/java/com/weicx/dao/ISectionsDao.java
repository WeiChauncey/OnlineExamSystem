package com.weicx.dao;

import com.weicx.domain.Sections;
import com.weicx.domain.Users;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author weicx
 * @create 2021-09-13 17:09
 * 与选项相关表：Sections、、、、
 */
public interface ISectionsDao {

    @Select("select * from Sections where id = #{id}")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "id", property = "stationList", many = @Many(select = "com.weicx.dao.IStationDao.findBySectionId")),
    })
    Sections findById(String id) throws Exception;

    @Select("select * from Sections ")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "id", property = "stationList", many = @Many(select = "com.weicx.dao.IStationDao.findBySectionId")),
    })
    List<Sections> findAll() throws Exception;

    @Delete("delete from sections where id = #{stationId}")
    void deleteSection(String sectionId);

    /**
     * 根据sectionId 修改工段信息
     * @param sectionId
     * @param sectionName
     */
    @Update("update sections set name =#{sectionName} where id = #{sectionName} ")
    void modifySection(@Param("sectionName")String sectionId, @Param("sectionName")String sectionName);
}
