package com.weicx.domain;/**
 * @author weicx
 * @create 2021-09-13 17:13
 */

import org.springframework.context.annotation.Primary;

/**
 * @ClassName Quiz_type
 * @Description  试卷类型
 * @Author weicx
 * @date 17:13
 * @Version 1.0
 */
public class Quiz_type {
    private Integer id       ;// 	Key
    private String title	  ;//
    private Integer ok_interval	   ;//   考试通过后，重考天数
    private Integer ng_interval	   ;//    考试未通过后，重考天数

    public Quiz_type() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getOk_interval() {
        return ok_interval;
    }

    public void setOk_interval(Integer ok_interval) {
        this.ok_interval = ok_interval;
    }

    public Integer getNg_interval() {
        return ng_interval;
    }

    public void setNg_interval(Integer ng_interval) {
        this.ng_interval = ng_interval;
    }
}
