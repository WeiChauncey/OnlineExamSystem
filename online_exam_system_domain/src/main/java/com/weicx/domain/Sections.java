package com.weicx.domain;/**
 * @author weicx
 * @create 2021-09-13 17:07
 */

import org.springframework.context.annotation.Primary;

import java.util.List;

/**
 * @ClassName Sections
 * @Description 工段信息
 * @Author weicx
 * @date 17:07
 * @Version 1.0
 */
public class Sections {
   private Integer id    ; //(Primary)	int(10)	No			工段ID
   private String name   ; //	varchar(20)	No
    private List<Station> stationList;

    public List<Station> getStationList() {
        return stationList;
    }

    public void setStationList(List<Station> stationList) {
        this.stationList = stationList;
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
}
