package com.weicx.service.tx.QuestionService;/**
 * @author weicx
 * @create 2021-10-09 10:40
 */

import com.weicx.domain.Question_type;

import java.util.List;

/**
 * @ClassName out
 * @Description 试题服务器输出类
 * @Author weicx
 * @date 10:40
 * @Version 1.0
 */
public class QuestionOut {
    private List<Question_type> typeList;
    private List<String> fileNameList   ;
    private List<Integer> scoreList      ;

    public List<Question_type> getTypeList() {
        return typeList;
    }

    public void setTypeList(List<Question_type> typeList) {
        this.typeList = typeList;
    }

    public List<String> getFileNameList() {
        return fileNameList;
    }

    public void setFileNameList(List<String> fileNameList) {
        this.fileNameList = fileNameList;
    }

    public List<Integer> getScoreList() {
        return scoreList;
    }

    public void setScoreList(List<Integer> scoreList) {
        this.scoreList = scoreList;
    }
}
