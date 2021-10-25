package com.weicx.controller;/**
 * @author weicx
 * @create 2021-10-21 11:01
 */

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.weicx.service.IHistoryService;
import com.weicx.service.tx.HistoryService.HistoryOut;
import com.weicx.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @ClassName HistoryController
 * @Description TODO
 * @Author weicx
 * @date 11:01
 * @Version 1.0
 */
@Controller
@RequestMapping("/history")
public class HistoryController {

    @Autowired
    private IHistoryService historyService;

    /**
     * 通过用户ID查询考试历史
     * @return
     * @throws Exception
     */
    @RequestMapping("/findHistoryByUser.do")
    public ModelAndView findHistoryByUser() throws Exception {
        ModelAndView mv = new ModelAndView();
        String username = UserUtils.findUserName();
        List<HistoryOut> historyMeList = historyService.findExamByUser(username);
        mv.addObject("historyMeList",historyMeList);
        mv.setViewName("history-me");  //返回的web页面
        return mv;
    }

    /**
     * 通过历史ID删除该考试历史
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping("/deleteHistoryById.do")
    public String deleteHistoryById(@RequestParam(name = "hid",required = true) Integer hid) throws Exception {
        String result = historyService.deleteHistoryById(hid);
        return JSONObject.toJSONString(result);
    }

    /**
     * 通过eid查询考试历史
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping("/findHistoryByEid.do")
    public String findHistoryByEid(@RequestParam(name = "eid") String eid) throws Exception {

        List<HistoryOut> historyMeList = historyService.findHistoryByEid(eid);
        return JSONObject.toJSONString(historyMeList, SerializerFeature.DisableCircularReferenceDetect);
    }

}
