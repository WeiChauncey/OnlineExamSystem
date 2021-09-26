package com.weicx.controller;/**
 * @author weicx
 * @create 2021-09-13 14:01
 */

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.weicx.domain.Question_lib;
import com.weicx.service.IQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @ClassName QuestionController
 * @Description 试题控制器
 * @Author weicx
 * @date 14:01
 * @Version 1.0
 */
@Controller
@RequestMapping("/question")
public class QuestionController {

    @Autowired
    private IQuestionService questionService;

//    @RequestMapping("/findAll.do")
//    public ModelAndView findAll() throws Exception {
//        ModelAndView mv = new ModelAndView();
//        List<Question_lib> questionLibs = questionService.findAll();
//        mv.addObject("questionLibs",questionLibs);
//        mv.setViewName("question-lib-list");
//        return mv;
//    }
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",required = true, defaultValue = "1") Integer page ,@RequestParam(name = "size", required = true ,defaultValue = "6") Integer size) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Question_lib> questionLibs = questionService.findAll(page,size);
        //PageInfo就是一个分页Bean
        PageInfo<Question_lib> questionLibPageInfo = new PageInfo(questionLibs);
        mv.addObject("pageInfo",questionLibPageInfo);
        mv.setViewName("question-lib-page-list");
        return mv;
    }

    @RequestMapping("/findById.do")
    public ModelAndView findAll(@RequestParam(name = "id",required = true) String questionLibId) throws Exception {
        ModelAndView mv = new ModelAndView();
        Question_lib questionLib = questionService.findById(questionLibId);
        mv.addObject("questionLib",questionLib);
        mv.setViewName("question-lib-show");
        return mv;
    }

}
