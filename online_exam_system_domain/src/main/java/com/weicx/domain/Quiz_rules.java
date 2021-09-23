package com.weicx.domain;/**
 * @author weicx
 * @create 2021-09-13 17:19
 */

/**
 * @ClassName Quiz_rules
 * @Description 试卷规则，定义各题型类型占比
 * @Author weicx
 * @date 17:19
 * @Version 1.0
 */
public class Quiz_rules {
    private String eid	  ; //varchar(13)	No			试卷ID
    private Integer qtype ; //	int(11)	No			题目类型
    private Integer score ; //	int(11)	No	0		该题型总分

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public Integer getQtype() {
        return qtype;
    }

    public void setQtype(Integer qtype) {
        this.qtype = qtype;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }
}
