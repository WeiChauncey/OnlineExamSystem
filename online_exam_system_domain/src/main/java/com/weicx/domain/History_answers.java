package com.weicx.domain;/**
 * @author weicx
 * @create 2021-10-21 17:17
 */

/**
 * @ClassName history_answers
 * @Description 填空、简答题答案记录表
 * @Author weicx
 * @date 17:17
 * @Version 1.0
 */
public class History_answers {
    private Integer id;    //  int(10)			AUTO_INCREMENT
    private Integer hid;  // 	int(10)
    private String qid;  //	varchar(13)		题目ID	e
    private String answer;  // text		用户输入的答案
    private Integer score;  // int(11)			该题的分值
    private Integer is_correct;  // 	tinyint(1)			该题是否已批阅

    public History_answers() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getHid() {
        return hid;
    }

    public void setHid(Integer hid) {
        this.hid = hid;
    }

    public String getQid() {
        return qid;
    }

    public void setQid(String qid) {
        this.qid = qid;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getIs_correct() {
        return is_correct;
    }

    public void setIs_correct(Integer is_correct) {
        this.is_correct = is_correct;
    }
}
