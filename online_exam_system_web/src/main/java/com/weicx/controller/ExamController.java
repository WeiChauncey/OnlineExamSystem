package com.weicx.controller;/**
 * @author weicx
 * @create 2021-10-15 15:55
 */

import com.weicx.dao.IExamDao;
import com.weicx.domain.*;
import com.weicx.service.IExamService;
import com.weicx.service.IQuizService;
import com.weicx.service.tx.ExamServiceUtils.ExamOut;
import com.weicx.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @ClassName ExamController
 * @Description 考试相关控制器
 * @Author weicx
 * @date 15:55
 * @Version 1.0
 */
@Controller
@RequestMapping("/exam")
public class ExamController {

    @Autowired
    private IExamService examService;

    @Autowired
    private IQuizService quizService;


    /**
     * 考试入口，查询待考试试卷
     * @return
     * @throws Exception
     */
    @RequestMapping("/findExamByUser.do")
    public ModelAndView findExamByUser() throws Exception {
        ModelAndView mv = new ModelAndView();
        String username = UserUtils.findUserName();
        List<Quiz> examList = examService.findExamByUser(username);
        mv.addObject("quizList",examList);
        mv.setViewName("exam-list");  //返回的web页面
        return mv;
    }

    /**
     * 考生考试界面
     * @param eid
     * @return
     * @throws Exception
     */
    @RequestMapping("/examDetailById.do")
    public ModelAndView examDetailById(@RequestParam(name = "eid",required = true) String eid) throws Exception {
        ModelAndView mv = new ModelAndView();
        ExamOut examOut = examService.examDetailById(eid);
        mv.addObject("questionLibs",examOut.getQuestions());
        mv.addObject("quizExam",examOut.getQuizInfo());
        mv.addObject("questionImgs",examOut.getImgs());
        mv.addObject("optionList",examOut.getOptionsList());
        mv.setViewName("exam-detail");
        return mv;
    }

}
