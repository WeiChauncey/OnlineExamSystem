package com.weicx.service.impl;/**
 * @author weicx
 * @create 2021-10-15 17:03
 */

import com.weicx.dao.*;
import com.weicx.domain.*;
import com.weicx.service.IExamService;
import com.weicx.service.tx.ExamServiceUtils.ExamOut;
import com.weicx.service.tx.ExamServiceUtils.QuestionSelecter;
import com.weicx.utils.UUIDUtils;
import com.weicx.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName ExamServiceImpl
 * @Description TODO
 * @Author weicx
 * @date 17:03
 * @Version 1.0
 */
@Service
@Transactional
public class ExamServiceImpl  implements IExamService {

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

    @Autowired
    private IExamDao examDao;

    @Autowired
    private IOptionsDao optionsDao;

    @Override
    public List<Quiz> findExamByUser(String username) throws Exception {
        //1 通过userName，查询出userId
        Users userInfo = usersDao.findByName(username);
        String userId = userInfo.getId();
        //2 获取所有Quiz
        List<Quiz> examByUserList = quizDao.findExamByUser(userId);
        List<Quiz> examList = new ArrayList<>();
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

    /**
     * 通过试卷Id，获取试卷内容
     * @param eid
     * @throws Exception
     */
    @Override
    public ExamOut examDetailById(String eid) throws Exception {
        String userName = UserUtils.findUserName();
        Users userInfo = usersDao.findByName(userName);
        String uid = userInfo.getId();
        //判断是否有正在进行的考试
        Integer submitTime = historyDao.findLatestQuiz(uid);
        if(submitTime!= null){
            if (submitTime>System.currentTimeMillis()-5){
                //alert("您有尚未处理完成的考试，请稍后重试!");
                //返回到待考试列表界面
            }
        }
        Quiz QuizInfo = quizDao.findById(eid);
        Integer section_id = QuizInfo.getStation().getId();
        String autoEid ="";

        //获取规则
        List<Quiz_rules> quizRules = examDao.findQuizRuleByEid(eid);
        if (quizRules.size()>0){
            //有规则为随机出题，生成随机试卷id
            autoEid = UUIDUtils.generateUuid8();
            examDao.saveUserQuiz(uid,eid,autoEid);
            for (Quiz_rules quizRule : quizRules){
                if (quizRule.getScore() ==0){
                    continue;
                }
                //get 该体型的所有试题，根据目标分数获取试题集合
                List<Question_lib> questionLibList  = question_libDao.findByEidQtype(section_id,quizRule.getQtype());

                List<Question_lib> resultList = QuestionSelecter.findResult(questionLibList, quizRule.getScore());
                if (resultList.size()>0){
                  for(int i=0;i<resultList.size();i++){
                      String qid = resultList.get(i).getQid();
                      //TODO : 拼接成一个SQL
                        if (qid!=null && (!qid.isEmpty())){
                            examDao.insertQuestion(autoEid,qid);
                        }
                    }


                }

            }


        }else {
            //无规则为手动出题，或者随机出题未定义出题规则

        }

        //添加历史,默认分数为0
        long start_time = System.currentTimeMillis()/1000;//10位时间戳
        //手动出卷时，antoEid为""
        if ("".equals(autoEid)){
            autoEid = eid;
        }
        historyDao.insertHistory(uid,autoEid, 0,start_time);
        List<Question_lib> questions = question_libDao.findByQuizAutoId(autoEid);
        List<Question_img> imgs = question_libDao.findImgByQuizAutoId(autoEid);
        List<Options> optionsList = optionsDao.findByQuizAutoId(autoEid);
        ExamOut examOut = new ExamOut(QuizInfo, questions, imgs,optionsList);

        return examOut;
    }
}