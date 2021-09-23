package com.weicx.controller;/**
 * @author weicx
 * @create 2021-09-15 18:33
 */

import com.weicx.domain.Sections;
import com.weicx.domain.Station;
import com.weicx.domain.Users;
import com.weicx.service.IManageService;
import com.weicx.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @ClassName UserController
 * @Description TODO
 * @Author weicx
 * @date 18:33
 * @Version 1.0
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;

    @Autowired
    private IManageService manageService;

    @RequestMapping("findAll.do")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Users> usersList = userService.findAll();
        mv.addObject("userList",usersList);
        mv.setViewName("user-list");

        return mv;
    }

    @RequestMapping("save.do")
    public String save(Users userInfo) throws Exception {
        userService.save(userInfo);
        return "redirect:findAll.do";
    }

    @RequestMapping("findById.do")
    public ModelAndView findById(@RequestParam(name = "id",required = true) String userId) throws Exception {
        ModelAndView mv = new ModelAndView();
        Users userInfo = userService.findById(userId);
        List<Station> stations = manageService.findAllStation();
        mv.addObject("stationList",stations);
        mv.addObject("user",userInfo);
        mv.setViewName("user-show");

        return mv;
    }

    @RequestMapping("deleteUser.do")
    public String deleteUser(@RequestParam(name = "id",required = true) String  userId) throws Exception {
        userService.deleteUser(userId);
        return "redirect:findAll.do";
    }

    /**
     * userId: 020243
     * oid: 2
     * pid: 3
     * mid: 4
     * pid: 5
     * oid: 6
     * @param userId
     * @param oids 所属岗位集合
     * @param pids 管理岗位集合
     * @param mids 出题岗位集合
     * @return
     */
    @RequestMapping("/modifyStationByUser.do")
    public String addRoleToUser(@RequestParam(name = "userId",required = true )String userId,@RequestParam(name = "oids" )Integer[] oids
            ,@RequestParam(name = "pids" )Integer[] pids,@RequestParam(name = "mids" )Integer[] mids) throws Exception {

        userService.modifyStationByUser(userId,oids,pids,mids);
        return "redirect:findById.do?id="+userId;
    }
}
