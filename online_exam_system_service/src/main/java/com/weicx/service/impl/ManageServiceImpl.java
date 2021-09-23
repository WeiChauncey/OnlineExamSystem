package com.weicx.service.impl;/**
 * @author weicx
 * @create 2021-09-13 14:58
 */

import com.weicx.dao.ISectionsDao;
import com.weicx.dao.IStationDao;
import com.weicx.domain.Sections;
import com.weicx.domain.Station;
import com.weicx.service.IManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @ClassName RoleServiceImpl
 * @Description TODO
 * @Author weicx
 * @date 14:58
 * @Version 1.0
 */
@Service
@Transactional
public class ManageServiceImpl implements IManageService {

    @Autowired
    private IStationDao stationDao;

    @Autowired
    private ISectionsDao sectionsDao;


    @Override
    public List<Station> findAllStation() throws Exception {
        return stationDao.findAll();
    }

    @Override
    public String deleteStation(String stationId) throws Exception {
        //查询是否有在岗人员
        Station station = stationDao.findById(stationId);
        if (station.getUsersList().size()>0){
            return "有在岗人员，不能删除该岗位";
        }else{
            stationDao.deleteStation(stationId);
            return "OK";
        }


    }

    @Override
    public List<Sections> findAllSection() throws Exception {
        return sectionsDao.findAll();
    }

    @Override
    public String deleteSection(String sectionId) throws Exception {
        //查询该工段是否有岗位信息
        Sections sectionList = sectionsDao.findById(sectionId);
        if (sectionList.getStationList().size()>0){
            return "有岗位信息，不能删除该工段";
        }else{
            sectionsDao.deleteSection(sectionId);
            return "OK";
        }
    }

    @Override
    public String modifySection(String sectionId, String sectionName) throws Exception {
        //查询该工段信息
        Sections sectionList = sectionsDao.findById(sectionId);
        if (sectionList!= null){
            sectionsDao.modifySection(sectionId,sectionName);
            return  "OK";
        }else{
            return "未查询到该工段信息";
        }
    }
}
