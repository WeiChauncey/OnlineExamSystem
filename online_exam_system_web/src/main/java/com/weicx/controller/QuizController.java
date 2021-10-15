package com.weicx.controller;

import com.weicx.domain.Quiz;
import com.weicx.service.IQuizService;
import com.weicx.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @ClassName QuizeController
 * @Description Quize试卷类的控制器
 * @Author weicx
 * @date 14:58
 * @Version 1.0
 */
@Controller
@RequestMapping("/quiz")
public class QuizController {

    @Autowired
    private IQuizService quizService;

    /**
     * 通过controller查询试卷信息，封装到ModelAndView中，相应页面中
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Quiz> quizList = quizService.findAll();
        mv.addObject("quizList",quizList);
        mv.setViewName("quiz-list");  //返回的web页面
        return mv;
    }

    /**
     * 增加试卷
     * @param quiz
     */
    @RequestMapping("/save.do")
    public String save(Quiz quiz) throws Exception {
        quizService.save(quiz);
//       保存成功后，重新查询一次
        return "redirect:findAll.do";
    }

    /**
     * 试卷详情
     * @param quizId
     * @return
     * @throws Exception
     */
    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam(name = "id",required = true) String quizId) throws Exception {
        ModelAndView mv = new ModelAndView();
        Quiz quizExam = quizService.findById(quizId);
        mv.addObject("quizExam",quizExam);
        mv.setViewName("quiz-info");  //返回的web页面
        return mv;
    }


    /**
     * 考试入口，查询待考试试卷
     * @return
     * @throws Exception
     */
    @RequestMapping("/findExamByUser.do")
    public ModelAndView findExamByUser() throws Exception {
        ModelAndView mv = new ModelAndView();
        String username = UserUtils.findUserName();
        List<Quiz> examList = quizService.findExamByUser(username);
        mv.addObject("quizList",examList);
        mv.setViewName("exam-list");  //返回的web页面
        return mv;
    }
}
