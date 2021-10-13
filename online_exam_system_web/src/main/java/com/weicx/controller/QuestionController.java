package com.weicx.controller;/**
 * @author weicx
 * @create 2021-09-13 14:01
 */

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.github.pagehelper.PageInfo;
import com.weicx.domain.*;
import com.weicx.service.IQuestionService;
import com.weicx.service.tx.QuestionService.QuestionOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

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
        List<Question_type> questionTypeList = questionService.findQuestionTypeAll();
        mv.addObject("questionTypeList",questionTypeList);
        List<Options> answerList = questionService.findAnswerByQuestionId(questionLibId);
        mv.addObject("answerList",answerList);
        List<Options> OptionList = questionService.findByQuestionId(questionLibId);
        mv.addObject("OptionList",OptionList);
        List<Question_img> imageList = questionService.findImageByQuestionId(questionLibId);
        mv.addObject("imageList",imageList);

        mv.setViewName("question-lib-show");
        return mv;
    }

    /**
     * 通过工位id，获得questionLib信息
     * @param station_id
     * @param page
     * @param size
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping("/findByStation.do")
    public String findByStation(@RequestParam(name = "station_id",required = true) String station_id,@RequestParam(name = "page",required = true, defaultValue = "1") Integer page ,@RequestParam(name = "size", required = true ,defaultValue = "20") Integer size) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Question_lib> questionLibs = questionService.findByStation(station_id,page,size);
        //PageInfo就是一个分页Bean
        PageInfo<Question_lib> questionLibPageInfo = new PageInfo(questionLibs);
        //禁止循环引用，避免JSON解析错误
        return JSONObject.toJSONString(questionLibPageInfo, SerializerFeature.DisableCircularReferenceDetect);
    }

    @ResponseBody
    @RequestMapping("/findBySearch.do")
    public String findBySearch(@RequestParam(name = "station_id",required = true) String station_id,@RequestParam(name = "d_qtype" ) Integer qtype ,@RequestParam(name = "d_score") Integer score,@RequestParam(name = "d_from") String from) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Question_lib> questionLibs = questionService.findBySearch(station_id,qtype,score,from);
        //禁止循环引用，避免JSON解析错误
        return JSONObject.toJSONString(questionLibs, SerializerFeature.DisableCircularReferenceDetect);
    }

    /**
     * init 试题列表search area Data
     * @param station_id
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping("/iniData.do")
    public String iniData(@RequestParam(name = "station_id",required = true) String station_id) throws Exception {
        ModelAndView mv = new ModelAndView();
        QuestionOut initData = questionService.initData(station_id);


        return JSONObject.toJSONString(initData);
    }


    //试卷id  站点ID   试题类型  试题分数  题目  配图数量
//    @RequestMapping("/modify.do")
//    public ModelAndView questionModifyold(
//
//    @RequestParam(name = "cur_qid",required = true) String qid,
//    @RequestParam(name = "sid",required = true) String sid,
//    @RequestParam(name = "qtype",required = true) Integer qtid,
//    @RequestParam(name = "qscore",required = true) String qscore,
//    @RequestParam(name = "qns",required = true) String qns,
//    @RequestParam(name = "img_cnt" ) Integer img_cnt,
//    @RequestParam(name = "imgPath" ,defaultValue = "0"  ) String imgPath,
//    @RequestParam(name = "imgw" , defaultValue = "0") Integer imgw,
//    @RequestParam(name = "imgh", defaultValue = "0") Integer imgh
//    ) throws Exception {
////        String imgPath ="";
////        Integer imgw=0;
////        Integer
//        //1 update questionLib
//        ModelAndView mv = new ModelAndView();
//        String replay = questionService.questionModify(qid,qns,qtid,qscore,img_cnt,imgPath,imgw,imgh);
//        mv.addObject("questionLib",replay);
//
//        mv.setViewName("question-lib-show");
//        return mv;
//    }
    /*sid: 4
       cur_qid: 5eaa46bbd35c3
       qtype: 1
       qscore: 2
       qns: 以下哪个为SOR机台BC端的报废Recipe()。
       img_cnt: 0
       opimg_1: 0
       opimgw_1: 0
       opimgh_1: 0
       op_1: Scrap Only

       opimg_2: 0
       opimgw_2: 0
       opimgh_2: 0
       op_2: Plan Sort
       opimg_3: 0
       opimgw_3: 0
       opimgh_3: 0
       op_3: Turn Only
       opimg_4: 0
       opimgw_4: 0
       opimgh_4: 0
       as[]: op_4
       op_4: 4Srcap Only*/
    @ResponseBody
    @RequestMapping("/modify1.do")
    public String questionModify(HttpServletRequest request) throws Exception {
//        String sid          =request.getParameter("sid");        //岗位ID
        String qid              =request.getParameter("cur_qid");        //试题id
        Integer  qtid             = Integer.valueOf(request.getParameter("qtype"));        //试题类型
        String qscore            =request.getParameter("qscore");        //试题分数
        String qns              =request.getParameter("qns");        //题目
        String[] answerList         = request.getParameterValues("as[]");        //获取答案选项的op_序号
        Integer img_cnt            = Integer.valueOf(request.getParameter("img_cnt"));        //题目配图数量
        String  imgPath ="";
        Integer  imgw=0;
        Integer  imgh=0;
        if (img_cnt!=0){ //有题目图片时，获取值
            imgPath         =request.getParameter("imgPath");             //
            imgw              = Integer.valueOf(request.getParameter("imgw"));        //
            imgh             = Integer.valueOf(request.getParameter("imgh"));        //
        }

        List<Options> optionsList = new ArrayList<>();
        Enumeration<String> parameterNames = request.getParameterNames();        //
        while (parameterNames.hasMoreElements()){
             String key = parameterNames.nextElement();
            Boolean isAnswer=false;
             //排除非选项
             if (!key.substring(0,3).equals("op_")){
                continue;
             }
            // 获得选项OP后面的序号,和内容
            String optionNo = key.split("_")[1];
            String  optionContext = request.getParameter(key).trim();
            if (optionContext.length()==0){//选项内容为空，不保存。如果选项为图片也要写内容
                continue;
            }

            if (Arrays.asList(answerList).contains(key)){
                 isAnswer =true;
            }

            //题目选项配图
            Integer isImg= Integer.valueOf(request.getParameter("opimg_"+optionNo));
            Integer imgWidth=Integer.valueOf(request.getParameter("opimgw_"+optionNo));
            Integer imgHigh=Integer.valueOf(request.getParameter("opimgh_"+optionNo));
            if(qtid == 3||qtid == 4|| qtid == 5){ //填空、简答、判断题没有选项图片
                isImg=0;
                imgWidth=0;
                imgHigh=0;
            }
            Options options = new Options(qid,optionContext,isImg,imgWidth,imgHigh,isAnswer);
            optionsList.add(options);
        }

        String replay = questionService.questionModify(qid,qns,qtid,qscore,img_cnt,imgPath,imgw,imgh,optionsList,answerList);


        //1 update questionLib
//        ModelAndView mv = new ModelAndView();
//        String replay = questionService.questionModify(questionLib);
////        mv.addObject("questionLib",replay);

//        mv.setViewName("question-lib-show");
        return JSONObject.toJSONString(replay);
    }

}
