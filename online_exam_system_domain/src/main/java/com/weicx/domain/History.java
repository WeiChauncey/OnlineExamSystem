package com.weicx.domain;
/**
 * @author weicx
 * @create 2021-10-14 18:18
 */


/**
 * @ClassName history
 * @Description 当为随机试卷时，历史表记录的是随机eid，Quiz表记录的是eid
 * @Author weicx
 * @date 18:18
 * @Version 1.0
 */
public class History {
    private Integer	id    ;          //    key		AUTO_INCREMENT
	private String	uid	         ;   //	用户ID
	private String	eid	         ;   //	试卷ID
	private Integer	score        ;   //	 分数
	private Integer	start_time	 ;   //	考试开始时间
	private Integer	submit_time	 ;    //	考试提交时间，时间戳/1000（精确到秒）

    public History() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getStart_time() {
        return start_time;
    }

    public void setStart_time(Integer start_time) {
        this.start_time = start_time;
    }

    public Integer getSubmit_time() {
        return submit_time;
    }

    public void setSubmit_time(Integer submit_time) {
        this.submit_time = submit_time;
    }
}
