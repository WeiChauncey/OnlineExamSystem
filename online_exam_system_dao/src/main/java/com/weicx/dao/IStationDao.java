package com.weicx.dao;

import com.weicx.domain.Quiz;
import com.weicx.domain.Station;
import com.weicx.domain.Users;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author weicx
 * @create 2021-09-13 14:45
 */
public interface IStationDao {

    //查询所有的岗位
    @Select("select * from station ")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "section_id", property = "section_id", one = @One(select = "com.weicx.dao.ISectionsDao.findById")),
            @Result(column = "id", property = "usersList", many = @Many(select = "com.weicx.dao.IUsersDao.findByStationId")),
    })
    List<Station> findAll() throws Exception;

    @Select("select * from station where id = #{id}")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "section_id", property = "section_id", one = @One(select = "com.weicx.dao.ISectionsDao.findById")),
            @Result(column = "id", property = "usersList", many = @Many(select = "com.weicx.dao.IUsersDao.findByStationId")),
    })
    Station findById(String id) throws Exception;

    @Delete("delete from station where id = #{stationId}")
    void deleteStation(String stationId) throws Exception;

    /**
     *
     * @param sectionId
     * @return
     * @throws Exception
     */
    @Select("select * from station where  section_id = #{sectionId}")
    List<Station> findBySectionId(String sectionId) throws Exception;

    @Select("select * from station where id in (select station from user_stations where uid = #{userId})")
    List<Station> findOwnStations(String userId) throws Exception;

    @Select("select * from station where id in (select station from user_powers where uid = #{userId})")
    List<Station> findPowerStations(String userId) throws Exception;

    @Select("select * from station where id in (select station from user_qmakers where uid = #{userId})")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "section_id", property = "section_id", one = @One(select = "com.weicx.dao.ISectionsDao.findById"))
    })
    List<Station> findQmakerStations(String userId) throws Exception;

}
