package com.weicx.domain;/**
 * @author weicx
 * @create 2021-09-13 14:41
 */

import org.springframework.context.annotation.Primary;

import java.util.List;

/**
 * @ClassName Station
 * @Description 岗位信息
 * @Author weicx
 * @date 14:41
 * @Version 1.0
 */
public class Station {
   private Integer id              ; //岗位ID     KEY
   private String name	 ;            //岗位名
   private Sections section_id	 ;   //工段ID
    private List<Users> usersList;   //用户信息

    public Station() {
    }

    public List<Users> getUsersList() {
        return usersList;
    }

    public void setUsersList(List<Users> usersList) {
        this.usersList = usersList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Sections getSection_id() {
        return section_id;
    }

    public void setSection_id(Sections section_id) {
        this.section_id = section_id;
    }
}
