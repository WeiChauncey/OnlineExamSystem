package com.weicx.service.impl;/**
 * @author weicx
 * @create 2021-09-12 14:34
 */

import com.weicx.dao.*;
import com.weicx.domain.*;
import com.weicx.service.IQuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Time;
import java.util.ArrayList;
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

    @Autowired
    private IHistoryDao historyDao;

    @Autowired
    private IQuiz_typeDao quizTypeDao;


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

    @Override
    public List<Quiz> findExamByUser(String username) throws Exception {
        //1 通过userName，查询出userId
        Users userInfo = usersDao.findByName(username);
        String userId = userInfo.getId();
        //2 获取所有Quiz
        List<Quiz> examByUserList = quizDao.findExamByUser(userId);
        List<Quiz> examList = new  ArrayList<>();
        //3 筛选符合条件的Quiz
        for (Quiz examByUser : examByUserList){
            Integer passScore = examByUser.getPass_score();//通过分数
            String eid = examByUser.getEid();    //试卷ID
            String quizTitle = examByUser.getType();  //试卷类型
            Integer isRandom = examByUser.getIs_random();
            List<History> historyList = new ArrayList<>();
            if (isRandom==1){ //随机
                //获取随机试卷ID，对应的随机试卷ID存在多个
                historyList = historyDao.findRandomQuizById(userId, eid);
            }else{
                historyList = historyDao.findByQuizId(userId, eid);
            }
            //如果该试卷有历史记录，判断是否满足重考条件，没有历史记录则需要考试
            if (historyList.size()>0){
                //最后一次提交信息（提交时间，分数，），历史记录数量
                History lastHis = historyList.get(0);
                Integer submit_time = lastHis.getSubmit_time();
                if (System.currentTimeMillis() - submit_time<5){
                    continue;
                }
                Quiz_type quizType = quizTypeDao.findByTitle(quizTitle);
                if (quizType.getOk_interval() == 0 || quizType.getNg_interval() == 0){
                    //自定义考试，依据试卷信息中设定的重考次数,历史考试次数大于等于设定值，不显示
                    if (examByUser.getRetry()<=historyList.size()){
                        continue;
                    }
                }else {
                    //TODO： score +  history_answer的分数和
                    //自动评卷分
                    Integer score = lastHis.getScore();//最近一条历史分数
                    //人工评卷分 history_answer的分数和
                    //get 考试周期
                    Integer periodTime = (score>=passScore?quizType.getOk_interval():quizType.getNg_interval())*24*60*60;
                    if (System.currentTimeMillis()-submit_time<periodTime){
                        continue;
                    }
                }
            }

            examList.add(examByUser);

        }

        return examList;
    }
}
