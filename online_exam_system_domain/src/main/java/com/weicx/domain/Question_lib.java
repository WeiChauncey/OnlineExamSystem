package com.weicx.domain;/**
 * @author weicx
 * @create 2021-09-12 19:53
 */

import java.util.List;

/**
 * @ClassName question_lib
 * @Description 试题库实体类
 * @Author weicx
 * @date 19:53
 * @Version 1.0
 */
public class Question_lib {
      private String qid      ;    //    '试题唯一性ID',
      private String qns      ;    //   '试题题目',
      private Question_type qtype    ;    //    '试题类型',一对一关系
      private Integer score    ;    //       '试题分值',
      private Station station  ;    //   '对应岗位', 一对一关系
      private Users owner    ;    //    '试题作者ID',一对一关系
      private String filename ;    //   '该题目所属文件名'
      private List<Quiz> Quizs;  //试卷，多对多

    public Question_lib() {
    }

    public List<Quiz> getQuizs() {
        return Quizs;
    }

    public void setQuizs(List<Quiz> quizs) {
        Quizs = quizs;
    }

    public String getQid() {
        return qid;
    }

    public void setQid(String qid) {
        this.qid = qid;
    }

    public String getQns() {
        return qns;
    }

    public void setQns(String qns) {
        this.qns = qns;
    }

    public Question_type getQtype() {
        return qtype;
    }

    public void setQtype(Question_type qtype) {
        this.qtype = qtype;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Station getStation() {
        return station;
    }

    public void setStation(Station station) {
        this.station = station;
    }

    public Users getOwner() {
        return owner;
    }

    public void setOwner(Users owner) {
        this.owner = owner;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }
}
