package com.weicx.utils;/**
 * @author weicx
 * @create 2021-10-20 13:20
 */

import java.util.List;

/**
 * @ClassName ListUtils
 * @Description TODO
 * @Author weicx
 * @date 13:20
 * @Version 1.0
 */
public class ListUtils {

    /**
     * 比较两个List集合是否相等
     * <p>2. 泛型参数E涉及到对象，所以需要确保正确实现了对应对象的<code>equal()</code>方法。
     * @param list1
     * @param list2
     * @return 两个list有值且值相同返回true
     */
    public static <E>boolean isListEqual(List<E> list1, List<E> list2) {

        // 两个list都为空（包括空指针、元素个数为0）
        if ((list1 == null && list2 != null && list2.size() == 0)
                || (list2 == null && list1 != null && list1.size() == 0)) {
            return false;
        }

        // 两个list引用相同（包括两者都为空指针的情况）
        if (list1 == list2) {
            return true;
        }

        // 两个list元素个数不相同
        if (list1.size() != list2.size()) {
            return false;
        }

        // 两个list元素个数已经相同，再比较两者内容
        // 采用这种可以忽略list中的元素的顺序
        // 涉及到对象的比较是否相同时，确保实现了equals()方法
        if (!list1.containsAll(list2)) {
            return false;
        }

        return true;
    }
}
