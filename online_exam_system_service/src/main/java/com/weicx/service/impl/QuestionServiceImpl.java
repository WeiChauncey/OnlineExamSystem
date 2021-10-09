package com.weicx.service.impl;/**
 * @author weicx
 * @create 2021-09-12 20:12
 */

import com.github.pagehelper.PageHelper;
import com.weicx.dao.IOptionsDao;
import com.weicx.dao.IQuestion_libDao;
import com.weicx.dao.IQuestion_typeDao;
import com.weicx.domain.*;
import com.weicx.service.IQuestionService;
import com.weicx.service.tx.QuestionService.QuestionOut;
import com.weicx.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

/**
 * @ClassName QuestionServiceImpl
 * @Description 试题服务层实现类
 * @Author weicx
 * @date 20:12
 * @Version 1.0
 */
@Service
@Transactional
public class QuestionServiceImpl implements IQuestionService {
    @Autowired
    private IQuestion_libDao question_libDao ;
    @Autowired
    private IOptionsDao optionsDao ;
    @Autowired
    private IQuestion_typeDao question_typeDao;

    @Override
    public List<Question_lib> findAll(int page, int size) throws Exception {
        //
        PageHelper.startPage(page,size);
        return question_libDao.findAll();
    }

    @Override
    public Question_lib findById(String questionLibId) throws Exception {
        return question_libDao.findById(questionLibId);
    }

    @Override
    public List<Question_lib> findByStation(String station_id, int page, int size) throws Exception {
        PageHelper.startPage(page,size);
        return question_libDao.findByStation(station_id);
    }

    @Override
    public List<Question_type> findQuestionTypeAll() throws Exception {
        return question_typeDao.findAll();
    }

    @Override
    public List<Options> findAnswerByQuestionId(String questionLibId) throws Exception {
        return optionsDao.findAnswerByQuestionId(questionLibId);
    }

    @Override
    public List<Options> findByQuestionId(String questionLibId) throws Exception {
        return optionsDao.findByQuestionId(questionLibId);
    }

    @Override
    public List<Question_img> findImageByQuestionId(String questionLibId) throws Exception {
        return optionsDao.findImageByQuestionId(questionLibId);
    }

    /**
     * 先删除表中信息，然后重新add，每个选项都生成UUID
     * @param qid
     * @param qns
     * @param qtid
     * @param qscore
     * @param img_cnt
     * @param imgPath
     * @param imgw
     * @param imgh
     * @return
     * @throws Exception
     */
//    @Override
//    public String questionModify(String qid, String qns, Integer qtid, String qscore, Integer img_cnt, String imgPath, Integer imgw, Integer imgh) throws Exception {
//        //1 modify question_lib
//        question_libDao.updateQuestion(qid,qns,qtid,qscore);
//        //2 delete question_img
//        optionsDao.delteImgByQuestionId(qid);
//        if (img_cnt>0){
//            //todo 将上传的图片保存
//            String imgUpLoadPath="upload/"+qid; //上传路径+试题id
//            String imgTempUpLoadPath="upload/temp"+qid; //临时上传路径
//            //imgUpLoadPath没有改文件则新建，有则打开该文件
//
//            for (int i = 0; i < img_cnt; i++) {
//                optionsDao.saveImgByQuestionId(qid,imgPath,imgw,imgh);
//            }
//        }
//        //3 delete options
//        optionsDao.delteOptionByQid(qid);
//        //4 delete answer
//        optionsDao.delteAnswerByQid(qid);
//        //5 add option and answer
//        //下面是循环，每个选项都新生成optionUUid，如果该选项是答案，则保存answer
//        String optionUUid = UUIDUtils.generateUuid8();
//
//        if (qtid==1||qtid==2 || qtid==5){  //单选、多选、判断，保存答案
//            //获取id="as 保存
//            optionsDao.saveAnswer(qid,optionUUid);
//        }
//
//
//        return null;
//    }



    @Override
    public String questionModify(String qid, String qns, Integer qtid, String qscore, Integer img_cnt, String imgPath, Integer imgw, Integer imgh, List<Options> optionsList,String[] answerList) throws Exception {
        //1 modify question_lib
        question_libDao.updateQuestion(qid,qns,qtid,qscore);
        //2 delete question_img
        optionsDao.delteImgByQuestionId(qid);
        if (img_cnt>0){ //题目图片
            //todo 将上传的图片保存
            String imgUpLoadPath="upload/"+qid; //上传路径+试题id
            String imgTempUpLoadPath="upload/temp"+qid; //临时上传路径
            //imgUpLoadPath没有改文件则新建，有则打开该文件

            for (int i = 0; i < img_cnt; i++) {
                //question_img
                optionsDao.saveImgByQuestionId(qid,imgPath,imgw,imgh);
            }
        }
        //3 delete options
        optionsDao.delteOptionByQid(qid);
        //4 delete answer
        optionsDao.delteAnswerByQid(qid);
        //5 add options and answer
        //下面是循环，每个选项都新生成optionUUid，如果该选项是答案，则保存answer
        for (Options option : optionsList){
            option.setOptionid(UUIDUtils.generateUuid8());
            if (option.getIs_img()==1){//有图片时
                //todo 将上传的图片保存

            }
            optionsDao.saveOption(option);
            if (qtid==1||qtid==2 || qtid==5){  //单选、多选、判断，保存答案
                //获取id="as 保存
                if (option.getAnswer()){
                    optionsDao.saveAnswer(qid,option.getOptionid());
                }

            }

        }
        return "T:更新成功!";
    }

    @Override
    public QuestionOut initData(String station_id) throws Exception {
        QuestionOut questionOut = new QuestionOut();
        List<Question_type> questoinTypeList = question_typeDao.findByStationId(station_id);
        List<String> fileNameList = question_libDao.findFileNameByStation(station_id);
        List<Integer> scoreList = question_libDao.findScoreByStation(station_id);
        questionOut.setTypeList(questoinTypeList);
        questionOut.setFileNameList(fileNameList);
        questionOut.setScoreList(scoreList);

        return questionOut;
    }


}
