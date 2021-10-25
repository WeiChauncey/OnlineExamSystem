package com.weicx.controller;/**
 * @author weicx
 * @create 2021-09-13 14:53
 */



import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.weicx.domain.Sections;
import com.weicx.domain.Station;
import com.weicx.service.IManageService;
import com.weicx.service.tx.ManageService.PowerStationOut;
import com.weicx.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @ClassName ManageController
 * @Description 岗位和工段
 * @Author weicx
 * @date 14:53
 * @Version 1.0
 */
@Controller
@RequestMapping("/manage")
public class ManageController {

    @Autowired
    private IManageService manageService;

    @RequestMapping("findAllStation.do")
    @PreAuthorize("hasRole('ROLE_ADMIN')") //admin角色可以操作
    public ModelAndView findAllStation() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Station> stations = manageService.findAllStation();
        mv.addObject("stationList",stations);
        mv.setViewName("station-list");
        return mv;
    }

    @RequestMapping("deleteStation.do")
    public String deleteStation(@RequestParam(name = "id",required = true) String stationId) throws Exception {
        String result = manageService.deleteStation(stationId);
        if (result.equals("OK")){
            //       保存成功后，重新查询一次
            return "redirect:findAllStation.do";
        }else {
            return "failer";
        }
    }

    @ResponseBody
    @RequestMapping("findAllSectionName.do")
    public String findAllSectionName() throws Exception {
        List<Sections> sectionsList = manageService.findAllSection();
        return JSONObject.toJSONString(sectionsList);
    }


    @RequestMapping("findAllSection.do")
    @PreAuthorize("authentication.principal.username =='admin'") //只有admin用户可以操作
    public ModelAndView findAllSection() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Sections> sectionsList = manageService.findAllSection();
        mv.addObject("sectionsList",sectionsList);
        mv.setViewName("sections-list");
        return mv;
    }


    @RequestMapping("deleteSection.do")
    public String deleteSection(@RequestParam(name = "id",required = true) String sectionId) throws Exception {
        String result = manageService.deleteSection(sectionId);
        if (result.equals("OK")){
            //       保存成功后，重新查询一次
            return "redirect:findAllSection.do";
        }else {
            return "failer";
        }
    }
    @RequestMapping("modifySection.do")
    public String modifySection(@RequestParam(name = "id",required = true) String sectionId,@RequestParam(name = "sectionName") String sectionName) throws Exception {
        String result = manageService.modifySection(sectionId,sectionName);
        if (result.equals("OK")){
            //       保存成功后，重新查询一次
            return "redirect:findAllSection.do";
        }else {
            return "failer";
        }
    }

    /**
     * 试题列表界面：
     * 遍历所有工段， 通过userNmae查询该人出题岗位
     * @return
     * @throws Exception
     */
    @RequestMapping("findSectionQuestionLib.do")
    public ModelAndView findSectionQuestionLib() throws Exception {
        ModelAndView mv = new ModelAndView();
        String username = UserUtils.findUserName();
        List<Sections> allSection = manageService.findAllSection();
        List<Station> stationList = manageService.findSationByUserName(username);
        mv.addObject("sectionsList",allSection);
        mv.addObject("stationList",stationList);
        mv.setViewName("question-lib-page-list-tree");
        return mv;
    }

    /**
     * 考生试题历史界面：
     *  通过userNmae查询该user_powers  对应的岗位
     *  输出手动出题试卷
     * @return
     * @throws Exception
     */
    @RequestMapping("findPowerByUid.do")
    public ModelAndView findPowerByUid() throws Exception {
        ModelAndView mv = new ModelAndView();
        String username = UserUtils.findUserName();
        List<PowerStationOut> powerStationList = manageService.findPowerStationByUid(username);
        mv.addObject("powerStationList",powerStationList);
        mv.setViewName("history-userpower");
        return mv;
    }

}
