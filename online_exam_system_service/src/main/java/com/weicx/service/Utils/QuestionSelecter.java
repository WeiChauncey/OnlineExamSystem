package com.weicx.service.Utils;/**
 * @author weicx
 * @create 2021-10-17 8:38
 */

import com.weicx.domain.Question_lib;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @ClassName QustionSelecter
 * @Description 随机出题试卷试题类
 * @Author weicx
 * @date 8:38
 * @Version 1.0
 */
public class QuestionSelecter {


    /**
     * 通过该试卷该题型下的试题集合，目标分数。获取随机试卷试题
     * @param qlib   该试卷该题型下的试题集合
     * @param targetScore 目标分数
     * @return 随机试卷试题
     */
    public static List<Question_lib> findResult(List<Question_lib> qlib, Integer targetScore){
        int scoreSum = 0;
        Collections.shuffle(qlib);
        Integer selectNo = 0;   //选择题库下标
        List<Question_lib> result = new ArrayList<>();  //最终试题集合
        List<Boolean> qFlagList = new ArrayList<>();
        while (selectNo<qlib.size()){
            qFlagList.add(selectNo, true);
            scoreSum += qlib.get(selectNo).getScore();

            if (scoreSum<targetScore && selectNo+1 < qlib.size()){
                //分值不够，且题库还有题，则继续出题
                selectNo++;
                continue;
            }else  if (scoreSum == targetScore){
                for (int j = 0; j <= selectNo ; j++) {
                    if (qFlagList.get(j)){
                        result.add(qlib.get(j));
                    }
                }
                //试卷分数正好满足条件
                break;
            }
            //集合中的试题分值>目标值
            qFlagList.set(selectNo,false);
            scoreSum -= qlib.get(selectNo).getScore();
            if (!qFlagList.contains(true)){
                //试题集合没有符合条件的出卷试题
                break;
            }
            if (selectNo+1 >= qlib.size()){ //todo 次数超过一定值，进行break,防止死循环
                //集合中的试题分值>目标值,且题库中没有其他试题
                //找到集合中最后一个出题的试题，扣除该试题，然后继续出题
                Collections.reverse(qFlagList);
                for (int i = 0; i < qFlagList.size(); i++) {
                    if (qFlagList.get(i)){
                        qFlagList.set(i,false);
                        scoreSum -= qlib.get(selectNo).getScore();
                        selectNo = i++;
                        break;
                    }
                }
            }else{
                selectNo ++;
            }

        }
        return result;
    }

}
