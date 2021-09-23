package com.weicx.controller;/**
 * @author weicx
 * @create 2021-09-13 14:53
 */



import com.weicx.domain.Sections;
import com.weicx.domain.Station;
import com.weicx.service.IManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @ClassName ManageController
 * @Description TODO
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


    @RequestMapping("findAllSection.do")
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


}
