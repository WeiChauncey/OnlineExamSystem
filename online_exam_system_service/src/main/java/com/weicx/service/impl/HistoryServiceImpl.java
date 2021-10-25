package com.weicx.service.impl;/**
 * @author weicx
 * @create 2021-10-21 11:24
 */

import com.weicx.dao.IExamDao;
import com.weicx.dao.IHistoryDao;
import com.weicx.dao.IQuizDao;
import com.weicx.dao.IUsersDao;
import com.weicx.domain.History;
import com.weicx.domain.History_answers;
import com.weicx.domain.Quiz;
import com.weicx.domain.Users;
import com.weicx.service.IHistoryService;
import com.weicx.service.tx.HistoryService.HistoryOut;
import com.weicx.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.weicx.service.Utils.QuizUtils.findAutoEidByEid;

/**
 * @ClassName HistoryServiceImpl
 * @Description TODO
 * @Author weicx
 * @date 11:24
 * @Version 1.0
 */
@Service
@Transactional
public class HistoryServiceImpl implements IHistoryService {
    @Autowired
    private IHistoryDao historyDao;
    @Autowired
    private IUsersDao usersDao;
    @Autowired
    private IQuizDao quizDao;
    @Autowired
    private IExamDao examDao;


    @Override
    public List<HistoryOut> findExamByUser(String username) throws Exception {
        //1 通过userName，查询出userId
        Users userInfo = usersDao.findByName(username);
        String userId = userInfo.getId();
        List<History> historyList = historyDao.findAllByUid(userId);
        List<HistoryOut> historyOutList = new ArrayList<>();
        for (History history : historyList) {
            Integer hid = history.getId();
            Integer userScore = history.getScore();
            long submit_time = history.getSubmit_time();
            //时间戳转化为字符串
            String submitTimeStr = DateUtils.dateToString(new Date(submit_time * 1000), "yyyy-MM-dd HH:mm:ss");
            //假设为随机试卷：
            String autoEid = history.getEid();
            //假设为随机试卷：随机autoEid和user_quiz找到eid ，通过eid找到quiz信息
            String eid = examDao.findQuizByAutoIdUid(userId, autoEid);
            if (eid == null) {
                //手动出题试卷
                eid = autoEid;

            }
            Quiz quizInfo = quizDao.findById(eid);
            if (null == quizInfo) {
                //todo 报错，未找到该试卷
                continue;
            }
            Integer pass_score = quizInfo.getPass_score();
            //get 人工判卷分数
            Integer remarkScore = 0;
            List<History_answers> answersList = historyDao.findHistoryAnswerByHid(hid);
            Integer isRemark = 1;
            if (answersList.size() == 0) {
                //没有需人工判卷试题时，则批阅
                isRemark = 1;
            } else {
                //有需人工判卷试题时
                for (History_answers history_answers : answersList) {
                    if (history_answers.getIs_correct() == 0) {
                        isRemark = 0;
                    }
                    remarkScore += history_answers.getScore();
                }
            }
            HistoryOut historyOut = new HistoryOut(hid, quizInfo.getTitle(), submitTimeStr, userScore, remarkScore, pass_score, isRemark);
            historyOutList.add(historyOut);

        }
        return historyOutList;
    }

    /**
     * 通过历史ID删除该考试历史
     *
     * @param hid
     * @return
     * @throws Exception
     */
    @Override
    public String deleteHistoryById(Integer hid) throws Exception {
        History lastHistory = historyDao.findLastHistoryByUid(hid);
        if (lastHistory == null) {
            return "NG";
        }
        String autoEid = lastHistory.getEid();
        String eid = examDao.findQuizByAutoId(autoEid);
        if (eid != null) {
            //随机出题试卷,删除questions、user_quiz
            examDao.deleteQuestionByEid(autoEid);
            examDao.deleteUserQuizByEid(autoEid);
        }
        historyDao.deleteAnswerByHid(hid);
        historyDao.deleteRecordByHid(hid);
        historyDao.deleteHistoryByHid(hid);
        return "OK";
    }

    @Override
    public List<HistoryOut> findHistoryByEid(String eid) throws Exception {
        Quiz quizInfo = quizDao.findById(eid);
        if (null == quizInfo) {
            //todo 报错，未找到该试卷
            return null;
        }
        Integer pass_score = quizInfo.getPass_score();


        //通过eid找到随机试卷ID
        List<String> autoEidList = examDao.findAutoQuizIdByEid(eid);
        List<HistoryOut> historyOutList = new ArrayList<>();
        if (autoEidList.size()==0){
            return historyOutList;
        }
        for (String autoEid : autoEidList) {
            Integer hid = historyDao.findByAutoEid(autoEid);
            if (hid ==null){
                continue;
            }

            //get 人工判卷分数
            Integer remarkScore = 0;
            List<History_answers> answersList = historyDao.findHistoryAnswerByHid(hid);
            History lastHistory = historyDao.findLastHistoryByUid(hid);
            Users userInfo = usersDao.findById(lastHistory.getUid());
            String userName = userInfo.getName();


            Integer userScore = lastHistory.getScore();
            long submit_time = lastHistory.getSubmit_time();
            //时间戳转化为字符串
            String submitTimeStr = DateUtils.dateToString(new Date(submit_time * 1000), "yyyy-MM-dd HH:mm:ss");
            Integer isRemark = 1;
            if (answersList.size() == 0) {
                //没有需人工判卷试题时，则批阅
                isRemark = 1;
            } else {
                //有需人工判卷试题时
                for (History_answers history_answers : answersList) {
                    if (history_answers.getIs_correct() == 0) {
                        isRemark = 0;
                    }
                    remarkScore += history_answers.getScore();
                }
            }
            String examResult ="未通过";
            if (remarkScore+userScore>=pass_score){
                examResult="通过";
            }else if (isRemark==0){
                examResult="待定";
            }
            HistoryOut historyOut = new HistoryOut(hid,userName, quizInfo.getTitle(), submitTimeStr, userScore, remarkScore, pass_score, examResult,isRemark);
            historyOutList.add(historyOut);
        }


        return historyOutList;
    }
}
