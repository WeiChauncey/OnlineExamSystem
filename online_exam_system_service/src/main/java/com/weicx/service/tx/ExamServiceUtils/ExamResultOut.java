package com.weicx.service.tx.ExamServiceUtils;/**
 * @author weicx
 * @create 2021-10-20 16:46
 */

import com.weicx.domain.History;

/**
 * @ClassName ExamResultOut
 * @Description TODO
 * @Author weicx
 * @date 16:46
 * @Version 1.0
 */
public class ExamResultOut {
    Integer remarkCount= 0;        //人工判卷试题数量
    Integer remarkScore = 0; //人工判卷试题分数
    History lastHistory;

    public ExamResultOut() {
    }

    public ExamResultOut(Integer remarkCount, Integer remarkScore, History lastHistory) {
        this.remarkCount = remarkCount;
        this.remarkScore = remarkScore;
        this.lastHistory = lastHistory;
    }

    public Integer getRemarkCount() {
        return remarkCount;
    }

    public void setRemarkCount(Integer remarkCount) {
        this.remarkCount = remarkCount;
    }

    public Integer getRemarkScore() {
        return remarkScore;
    }

    public void setRemarkScore(Integer remarkScore) {
        this.remarkScore = remarkScore;
    }

    public History getLastHistory() {
        return lastHistory;
    }

    public void setLastHistory(History lastHistory) {
        this.lastHistory = lastHistory;
    }
}
