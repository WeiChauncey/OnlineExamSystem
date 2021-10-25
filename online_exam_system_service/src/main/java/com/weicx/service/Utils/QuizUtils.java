package com.weicx.service.Utils;/**
 * @author weicx
 * @create 2021-10-22 19:22
 */

import com.weicx.dao.IExamDao;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @ClassName QuizUtils
 * @Description TODO
 * @Author weicx
 * @date 19:22
 * @Version 1.0
 */
public class QuizUtils {
    @Autowired
    private static IExamDao examDao;

    /**
     * 通过试卷id，找到第一个随机试卷Id，手动出卷返回试卷id
     *
     * @param eid
     * @return
     * @throws Exception
     */
    public static String findAutoEidByEid(String eid) throws Exception {
        String autoEId = "";
        List<String> autoQuizList = examDao.findAutoQuizIdByEid(eid);
        if (autoQuizList.size() > 0) {
            autoEId = autoQuizList.get(0);
        } else {
            autoEId = eid;
        }
        return autoEId;
    }
}
