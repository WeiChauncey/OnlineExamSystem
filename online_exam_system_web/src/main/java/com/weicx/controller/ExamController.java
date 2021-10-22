package com.weicx.controller;/**
 * @author weicx
 * @create 2021-10-15 15:55
 */

import com.weicx.domain.*;
import com.weicx.service.IExamService;
import com.weicx.service.IQuizService;
import com.weicx.service.tx.ExamService.ExamOut;
import com.weicx.service.tx.ExamService.ExamResultOut;
import com.weicx.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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
        mv.addObject("hid",examOut.getHid());
        mv.addObject("autoEid",examOut.getAutoEid());
        mv.setViewName("exam-detail");
        return mv;
    }
    /**
     * 考试界面自动提交请求，每5秒请求一次
     * 上传非简答题答案
     * 前台选项的name为：ans_5eaa46bc41fc4   ans_选项ID ;vale为选项Id
     * @param request
     * @return
     * @throws Exception
     */

    @RequestMapping("/autoSubmit.do")
    public ModelAndView autoSubmit(HttpServletRequest request) throws Exception {
        String eid = request.getParameter("eid");
        Integer hid = Integer.valueOf(request.getParameter("hid"));
        String autoEid = request.getParameter("autoEid");
        String result = examService.autoSubmit(eid, hid, autoEid, request);
        ModelAndView mv = new ModelAndView();
        ExamResultOut examResult = examService.getExamResult(hid);
        mv.addObject("examResult",examResult);
        mv.setViewName("exam-result");  //返回的web页面
        return mv;
    }

//    /**
//     * 考试界面自动提交请求，每5秒请求一次
//     * 上传简答题答案
//     * @param eid
//     * @return
//     * @throws Exception
//     */
//    @RequestMapping("/brifAnswer.do")
//    public ModelAndView brifAnswer(@RequestParam(name = "eid",required = true) String eid) throws Exception {
//        ModelAndView mv = new ModelAndView();
//
//        return mv;
//    }

    /**
     * 显示考试结果
     * 自动判卷分数，人工判卷分数、题目数量
     * @return
     * @throws Exception
     */
    @RequestMapping("/result.do")
    public ModelAndView examResult(@RequestParam(name = "hid",required = true) Integer hid) throws Exception {
        ModelAndView mv = new ModelAndView();
        ExamResultOut examResult = examService.getExamResult(hid);
        mv.addObject("examResult",examResult);
        mv.setViewName("exam-result");  //返回的web页面
        return mv;
    }
}
