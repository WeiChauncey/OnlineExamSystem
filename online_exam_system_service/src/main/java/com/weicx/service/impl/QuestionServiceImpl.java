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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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


}
