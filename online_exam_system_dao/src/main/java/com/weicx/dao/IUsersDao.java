package com.weicx.dao;

import com.weicx.domain.Question_lib;
import com.weicx.domain.Role;
import com.weicx.domain.Station;
import com.weicx.domain.Users;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author weicx
 * @create 2021-09-13 16:47
 */
public interface IUsersDao {

    //TODO :显示用户详情  SELECT * FROM `users` WHERE id in ( SELECT DISTINCT `uid` as id  FROM `user_powers` )
    @Select("select * from Users where id = #{id}")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "id", property = "ownStations", many = @Many(select = "com.weicx.dao.IStationDao.findOwnStations")),
            @Result(column = "id", property = "powerStations", many = @Many(select = "com.weicx.dao.IStationDao.findPowerStations")),
            @Result(column = "id", property = "qmakerStations", many = @Many(select = "com.weicx.dao.IStationDao.findQmakerStations")),
    })
    Users findById(String id) throws Exception;


    /**
     * 通过试岗位Id找到用户表集合
     * @param stationId
     * @return
     */
    @Select("select * from Users where id in (select uid from user_stations where station = #{stationId})")
    List<Users> findByStationId(String stationId) throws Exception;

    @Select("select * from Users")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "id", property = "ownStations", many = @Many(select = "com.weicx.dao.IStationDao.findOwnStations")),
            @Result(column = "id", property = "powerStations", many = @Many(select = "com.weicx.dao.IStationDao.findPowerStations")),
            @Result(column = "id", property = "qmakerStations", many = @Many(select = "com.weicx.dao.IStationDao.findQmakerStations")),
    })
    List<Users> findAll() throws Exception;

    @Insert("insert into users (id,name,password,admin) values (#{id},#{name},#{password},#{admin})")
    void save(Users userInfo) throws Exception;

    @Delete("DELETE FROM users  WHERE id=#{userId}")
    void deleteUser(String userId) throws Exception;


    @Delete("DELETE FROM user_stations WHERE uid=#{userId}")
    void deleteUserStation(String userId) throws Exception;

    @Delete("DELETE FROM user_powers WHERE uid=#{userId}")
    void deleteUserPower(String userId) throws Exception;

    @Delete("DELETE FROM user_qmakers WHERE uid=#{userId}")
    void deleteUserMaker(String userId) throws Exception;

    @Insert("insert into user_stations (uid,station) values (#{userId},#{oid})")
    void insertUserStation(@Param("userId")String userId, @Param("oid")Integer oid) throws Exception;

    @Insert("insert into user_powers (uid,station) values (#{userId},#{pid})")
    void insertUserPower(@Param("userId")String userId, @Param("pid")Integer pid) throws Exception;

    @Insert("insert into user_qmakers (uid,station) values (#{userId},#{mid})")
    void insertUserMaker(@Param("userId")String userId, @Param("mid") Integer mid) throws Exception;

    @Select("select * from Users where  name=#{username}")
    Users findByName(String username) throws Exception;
}
