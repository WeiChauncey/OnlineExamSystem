package com.weicx.service.impl;/**
 * @author weicx
 * @create 2021-09-12 14:34
 */

import com.weicx.dao.IQuestion_libDao;
import com.weicx.dao.IQuizDao;
import com.weicx.dao.IUsersDao;
import com.weicx.domain.Question_lib;
import com.weicx.domain.Quiz;
import com.weicx.domain.Users;
import com.weicx.service.IQuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.weicx.utils.UUIDUtils.generateUuid8;

/**
 * @ClassName QuizServiceImpl
 * @Description 试卷服务层实现类
 * @Author weicx
 * @date 14:34
 * @Version 1.0
 */
@Service
@Transactional
public class QuizServiceImpl implements IQuizService {

    //找到持久层的Dao类
    @Autowired
    private IQuizDao quizDao;

    @Autowired
    private IUsersDao usersDao;

    @Autowired
    private IQuestion_libDao question_libDao;

    @Override
    public List<Quiz> findAll() throws Exception {
        return quizDao.findAll();
    }

    @Override
    public void save(Quiz quiz) throws Exception {
        quiz.setEid(generateUuid8());
        //TODO:需要换成操作人
        quiz.setOwner( usersDao.findById("V0020243"));
        quizDao.save(quiz);
    }

    @Override
    public Quiz findById(String quizId) throws Exception {
        //1、检查未完成的exam

        String usersid = "V0042644";
        //2 创建随机试卷quiz_rules
        String autoQuizId = quizDao.findAutoQuizId(usersid, quizId);
        //3 找到对应岗位的题目，通过题型和占比生成question

        //4 查询试卷信息

        //5 通过随机试卷ID查询试题信息
//        List<Question_lib> byQuizAutoId = IQuestion_libDao.findByQuizAutoId(autoQuizId);
        Quiz quiz = new Quiz();
        quiz.setQuestion_libs(question_libDao.findByQuizAutoId(autoQuizId));
        return quiz;
    }
}
