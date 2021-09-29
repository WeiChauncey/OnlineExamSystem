package com.weicx.domain;/**
 * @author weicx
 * @create 2021-09-13 16:42
 */

import java.util.List;

/**
 * @ClassName Users
 * @Description 用户表
 * @Author weicx
 * @date 16:42
 * @Version 1.0
 */
public class Users {
    private String  id ;//(Pr imary)	varchar(8)	No
    private String  name	 ;//varchar(50)	No			用户真实姓名
    private String  password ;//	varchar(50)	No			用户密码
    private Integer  admin	 ;//1:管理员 ROLE_ADMIN     其他：ROLE_USER
    private List<Station> ownStations;  //所属岗位
    private List<Station> powerStations;  //负责岗位（出卷人）
    private List<Station> qmakerStations;  //出题岗位
    private List<Integer> ownStationsId;  //所属岗位
    private List<Integer> powerStationsId;  //负责岗位（出卷人）
    private List<Integer> qmakerStationsId;  //出题岗位

    public Users() {
    }

    public List<Integer> getOwnStationsId() {
        return ownStationsId;
    }

    public void setOwnStationsId(List<Integer> ownStationsId) {
        this.ownStationsId = ownStationsId;
    }

    public List<Integer> getPowerStationsId() {
        return powerStationsId;
    }

    public void setPowerStationsId(List<Integer> powerStationsId) {
        this.powerStationsId = powerStationsId;
    }

    public List<Integer> getQmakerStationsId() {
        return qmakerStationsId;
    }

    public void setQmakerStationsId(List<Integer> qmakerStationsId) {
        this.qmakerStationsId = qmakerStationsId;
    }

    public List<Station> getOwnStations() {
        return ownStations;
    }

    public void setOwnStations(List<Station> ownStations) {
        this.ownStations = ownStations;
    }

    public List<Station> getPowerStations() {
        return powerStations;
    }

    public void setPowerStations(List<Station> powerStations) {
        this.powerStations = powerStations;
    }

    public List<Station> getQmakerStations() {
        return qmakerStations;
    }

    public void setQmakerStations(List<Station> qmakerStations) {
        this.qmakerStations = qmakerStations;
    }
    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getAdmin() {
        return admin;
    }

    public void setAdmin(Integer admin) {
        this.admin = admin;
    }
}
