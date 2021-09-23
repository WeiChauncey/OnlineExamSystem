package com.weicx.domain;/**
 * @author weicx
 * @create 2021-09-13 16:31
 */

import org.springframework.context.annotation.Primary;

/**
 * @ClassName Question_type
 * @Description 试题的类型：单选，多选，填空，简答，判断
 * @Author weicx
 * @date 16:31
 * @Version 1.0
 */
public class Question_type {
    private Integer qtid ;       // (Primary)	int(10)	No
    private String name ;       //	varchar(50)	No

    public Integer getQtid() {
        return qtid;
    }

    public void setQtid(Integer qtid) {
        this.qtid = qtid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
