package com.weicx.service;

import com.weicx.domain.Question_lib;
import com.weicx.domain.Sections;
import com.weicx.domain.Station;

import java.util.List;

/**
 * @author weicx
 * @create 2021-09-12 20:11
 */
public interface IManageService {

    //查询所有的岗位
    List<Station> findAllStation() throws Exception;

    //删除岗位
    String deleteStation(String stationId) throws Exception;

    //查询所有的工段
    List<Sections> findAllSection() throws Exception;

    String deleteSection(String sectionId) throws Exception;

    String modifySection(String sectionId, String sectionName) throws Exception;
}
