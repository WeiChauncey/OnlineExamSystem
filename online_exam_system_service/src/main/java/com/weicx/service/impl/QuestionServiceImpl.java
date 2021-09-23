package com.weicx.service.impl;/**
 * @author weicx
 * @create 2021-09-12 20:12
 */

import com.github.pagehelper.PageHelper;
import com.weicx.dao.IQuestion_libDao;
import com.weicx.domain.Question_lib;
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


}
