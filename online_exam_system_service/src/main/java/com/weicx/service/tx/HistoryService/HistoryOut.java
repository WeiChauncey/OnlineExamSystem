package com.weicx.service.tx.HistoryService;/**
 * @author weicx
 * @create 2021-10-21 16:12
 */

/**
 * @ClassName HistoryOut
 * @Description TODO
 * @Author weicx
 * @date 16:12
 * @Version 1.0
 */
public class HistoryOut {

    private Integer hid;
    private String title;
    private String submit_timeStr;
    private Integer userScore;       //自动判卷分数
    private Integer remarkScore;  //人工判卷分数
    private Integer pass_score;
    private Integer isCorrect;       //0未批阅，1批阅

    public HistoryOut() {
    }

    public HistoryOut(Integer hid, String title, String submit_timeStr, Integer userScore, Integer remarkScore, Integer pass_score, Integer isCorrect) {
        this.hid = hid;
        this.title = title;
        this.submit_timeStr = submit_timeStr;
        this.userScore = userScore;
        this.remarkScore = remarkScore;
        this.pass_score = pass_score;
        this.isCorrect = isCorrect;
    }

    public Integer getHid() {
        return hid;
    }

    public void setHid(Integer hid) {
        this.hid = hid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubmit_timeStr() {
        return submit_timeStr;
    }

    public void setSubmit_timeStr(String submit_timeStr) {
        this.submit_timeStr = submit_timeStr;
    }

    public Integer getUserScore() {
        return userScore;
    }

    public void setUserScore(Integer userScore) {
        this.userScore = userScore;
    }

    public Integer getRemarkScore() {
        return remarkScore;
    }

    public void setRemarkScore(Integer remarkScore) {
        this.remarkScore = remarkScore;
    }

    public Integer getPass_score() {
        return pass_score;
    }

    public void setPass_score(Integer pass_score) {
        this.pass_score = pass_score;
    }

    public Integer getIsCorrect() {
        return isCorrect;
    }

    public void setIsCorrect(Integer isCorrect) {
        this.isCorrect = isCorrect;
    }
}
