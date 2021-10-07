package com.weicx.domain;/**
 * @author weicx
 * @create 2021-09-13 17:26
 */

import java.io.Serializable;

/**
 * @ClassName Answer
 * @Description 试题的答案选项
 * @Author weicx
 * @date 17:26
 * @Version 1.0
 */
public class Answer implements Serializable {
    private String qid	  ;//试题id  mediumtext	No
    private String ansid  ;//答案	mediumtext	No

    public Answer() {
    }

    public String getQid() {
        return qid;
    }

    public void setQid(String qid) {
        this.qid = qid;
    }

    public String getAnsid() {
        return ansid;
    }

    public void setAnsid(String ansid) {
        this.ansid = ansid;
    }
}
