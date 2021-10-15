在online_exam_system_web下创建java、resources目录，用来存放配置文件


## 表结构
题库：question_lib,question_type,operation,answer   
卷库：quiz,quiz_rules,quiz_type    
用户：users
设置：station，section
历史、报表：history,history_record

中间数据表：
user_powers  用户和管理岗位中间表
user_qmakers 用户和出题人岗位中间表
user_quiz  用户和试卷中间表
user_stations 用户对应岗位列表（考试入口判断逻辑）
questions    试卷、题目中间表  eid,qid


## 关联表查询
1、一对一：表A中有一个值是另一个表B的主键
则定义表A实体类时：private 表B 表A的字段
Dao中，使用one = @One(select = "com.weicx.dao.IUsersDao.findById")
2、多对多：两个表使用中间表连接
则定义表A实体类时：private List<表B> 表A的字段
使用many,通过查中间表处理
3、


## 分页
0、导入jar包和配置信息                                          
1、jsp界面请求时增加：question/findAll.do?page=1&size=4
2、Controller中增加必须接收参数设置
3、Service中，调拨findAll方法前加PageHelper.startPage(page,size);
4、Controller中增加
  //PageInfo就是一个分页Bean
        PageInfo<Question_lib> questionLibPageInfo = new PageInfo(questionLibs);
        mv.addObject("pageInfo",questionLibPageInfo);
        mv.setViewName("question-lib-page-list");
5、jsp页面通过.list获得数据


问题点：
1、insert quiz时，ID为无意义字段，如何生成？
通过添加UUIDUtils工具类解决。
2、user-show如何显示所属岗位、管理岗位、出题岗位checkBox状态
user增加List<String>字段，汇总岗位id信息

