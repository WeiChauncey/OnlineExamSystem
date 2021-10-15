package com.weicx.domain;

import com.weicx.utils.DateUtils;

import java.util.Date;
import java.util.List;

/**
 * @ClassName Quiz
 * @Description 试卷实体类,包含试卷信息
 * @Author weicx
 * @date 14:14
 * @Version 1.0
 */
public class Quiz {
    private String eid;    //试卷唯一性ID',
    private String title;  //'试卷标题',
    private Station station;  //'试卷所属岗位',一对一
    private Integer time;   //考试时长',
    private Date cdate;      //'试卷创建时间',
    private Integer closed;  //'是否关闭试卷', 1 已关闭，0 开放中 ，else 未定义
    private Users owner;  //'试卷作者',
    private Integer pass_score;  //通过分数，默认90
    private String type; // '月考',一对一
    private Integer is_random; // '是否是随机出题试卷', 0 手动,   1 随机
    private Integer retry;      // '重考次数'
    private String is_randomStr;
    private String closedStr;
    private String cdateStr;
    private List<Question_lib> Question_libs;  //试题，多对多

    public Quiz() {
    }

    public Station getStation() {
        return station;
    }

    public void setStation(Station station) {
        this.station = station;
    }

    public List<Question_lib> getQuestion_libs() {
        return Question_libs;
    }

    public void setQuestion_libs(List<Question_lib> question_libs) {
        Question_libs = question_libs;
    }

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getTime() {
        return time;
    }

    public void setTime(Integer time) {
        this.time = time;
    }

    public Date getCdate() {
        return cdate;
    }

    public void setCdate(Date cdate) {
        this.cdate = cdate;
    }

    public Integer getClosed() {
        return closed;
    }

    public void setClosed(Integer closed) {
        this.closed = closed;
    }

    public Users getOwner() {
        return owner;
    }

    public void setOwner(Users owner) {
        this.owner = owner;
    }

    public Integer getPass_score() {
        return pass_score;
    }

    public void setPass_score(Integer pass_score) {
        this.pass_score = pass_score;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getIs_random() {
        return is_random;
    }

    public void setIs_random(Integer is_random) {
        this.is_random = is_random;
    }

    public Integer getRetry() {
        return retry;
    }

    public void setRetry(Integer retry) {
        this.retry = retry;
    }

    public String getIs_randomStr() {
        if (null != is_random) {
            if (is_random == 0) {
                is_randomStr = "手动";
            } else {
                is_randomStr = "随机";
            }
        }
        return is_randomStr;
    }

    public void setIs_randomStr(String is_randomStr) {
        this.is_randomStr = is_randomStr;
    }

    public String getClosedStr() {
        if (null != closed) {
            if (closed==1) {
                closedStr = "已关闭";
            } else if (closed==0) {
                closedStr = "开放中";
            } else {
                closedStr = "未定义";
            }
        }
        return closedStr;
    }

    public void setClosedStr(String closedStr) {
        this.closedStr = closedStr;
    }


    public String getCdateStr() {
        if (null !=cdate){
            cdateStr = DateUtils.dateToString(cdate,"yyyy-MM-dd HH:mm:ss");
        }
        return cdateStr;
    }

    public void setCdateStr(String cdateStr) {
        this.cdateStr = cdateStr;
    }
}
