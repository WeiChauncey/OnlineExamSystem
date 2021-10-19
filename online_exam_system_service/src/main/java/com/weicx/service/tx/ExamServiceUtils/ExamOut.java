package com.weicx.service.tx.ExamServiceUtils;/**
 * @author weicx
 * @create 2021-10-17 15:29
 */

import com.weicx.domain.Options;
import com.weicx.domain.Question_img;
import com.weicx.domain.Question_lib;
import com.weicx.domain.Quiz;

import java.util.List;

/**
 * @ClassName ExamOut
 * @Description TODO
 * @Author weicx
 * @date 15:29
 * @Version 1.0
 */
public class ExamOut {

    private Quiz QuizInfo;   //试卷信息
    private List<Question_lib> questions;   //试题题目
    private List<Question_img> imgs; //试题图片集合
    private List<Options> optionsList; //选项集合


    public ExamOut() {
    }

    public ExamOut(Quiz quizInfo, List<Question_lib> questions, List<Question_img> imgs, List<Options> optionsList) {
        QuizInfo = quizInfo;
        this.questions = questions;
        this.imgs = imgs;
        this.optionsList = optionsList;
    }

    public Quiz getQuizInfo() {
        return QuizInfo;
    }

    public void setQuizInfo(Quiz quizInfo) {
        QuizInfo = quizInfo;
    }

    public List<Question_lib> getQuestions() {
        return questions;
    }

    public void setQuestions(List<Question_lib> questions) {
        this.questions = questions;
    }

    public List<Question_img> getImgs() {
        return imgs;
    }

    public void setImgs(List<Question_img> imgs) {
        this.imgs = imgs;
    }

    public List<Options> getOptionsList() {

        return optionsList;
    }

    public void setOptionsList(List<Options> optionsList) {
        this.optionsList = optionsList;
    }
}
