package com.weicx.service.tx.ManageService;/**
 * @author weicx
 * @create 2021-10-22 16:48
 */

import com.weicx.domain.Quiz;

import java.util.List;

/**
 * @ClassName PowerStationOut
 * @Description 历史->考生 树结构输入类
 * @Author weicx
 * @date 16:48
 * @Version 1.0
 */
public class PowerStationOut {

    private String stationName;
    private List<Quiz> quizNameList;

    public PowerStationOut() {
    }

    public String getStationName() {
        return stationName;
    }

    public void setStationName(String stationName) {
        this.stationName = stationName;
    }

    public List<Quiz> getQuizNameList() {
        return quizNameList;
    }

    public void setQuizNameList(List<Quiz> quizNameList) {
        this.quizNameList = quizNameList;
    }
}
