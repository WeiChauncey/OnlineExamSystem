package com.weicx.controller;/**
 * @author weicx
 * @create 2021-09-25 19:10
 */

import com.weicx.domain.SysLog;
import com.weicx.service.ISysLogService;
import com.weicx.utils.UUIDUtils;
import com.weicx.utils.UserUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.util.Date;
import static com.weicx.utils.UUIDUtils.generateUuid8;

/**
 * @ClassName LogAop
 * @Description 记录log的Controller，运用面向切面编程
 * @Author weicx
 * @date 19:10
 * @Version 1.0
 */
@Component
@Aspect
public class LogAop {

    @Autowired
    private HttpServletRequest request;
    @Autowired
    private ISysLogService sysLogService;

    private Date startTime;//开始时间
    private Class executionClass;//访问的类
    private Method executionMethod;//访问的方法

    //前置通知，拦截所有Controller方法
    //获取开始时间，执行的类，执行的方法
    @Before("execution(* com.weicx.controller.*.*(..))")
    public  void  doBefore(JoinPoint jp) throws NoSuchMethodException {
        startTime = new Date();//获取开始时间
        executionClass = jp.getTarget().getClass();//获取要执行的类
        if (executionClass!=null && executionClass!=ExamController.class && executionClass !=LogAop.class){
            String methodName = jp.getSignature().getName();//获取访问的方法名称
            Object[] args = jp.getArgs();//获取访问方法的参数
            if (args==null||args.length==0){
                executionMethod=executionClass.getMethod(methodName);//只能获取无参数的方法
            }else {
                Class[] classArgs = new Class[args.length];
                for (int i = 0; i < args.length; i++) {
                    classArgs[i]=args[i].getClass();//获取每个参数的class，放入classArgs数组
                }
                //捕获 public ModelAndView questionModify(HttpServletRequest request) 异常

                try {
                    executionMethod = executionClass.getMethod(methodName, classArgs);
                } catch (NoSuchMethodException e) {
                    e.printStackTrace();
                } catch (SecurityException e) {
                    e.printStackTrace();
                }
            }
        }



    }

    //后置通知，拦截所有Controller方法
    @After("execution(* com.weicx.controller.*.*(..))")
    public  void  doAfter(JoinPoint jp) throws Exception {
        //获取访问时长
        long time = new Date().getTime() - startTime.getTime();

        //获取url  @RequestMapping("/manage")   @RequestMapping("findAllStation.do")
        String url="";
        if (executionClass!=null && executionMethod!=null && executionClass!=ExamController.class && executionClass !=LogAop.class){
            //1 获取类的@RequestMapping()
            RequestMapping classAnnotation = (RequestMapping) executionClass.getAnnotation(RequestMapping.class);
            if (classAnnotation != null){
                String[] classValue = classAnnotation.value();

                //2 获取方法上的 @RequestMapping()
                RequestMapping methodAnnotation = (RequestMapping) executionMethod.getAnnotation(RequestMapping.class);
                if (methodAnnotation != null ){
                    String[] methodValue = methodAnnotation.value();
                    //manage/findAllStation.do
                    url = classValue[0]+methodValue[0];

                    //获取IP地址
                    String ip = request.getRemoteAddr();

                    //获取当前操作的用户 ，通过springSecurity框架获得
//                    SecurityContext context = SecurityContextHolder.getContext(); //从上下文中获取当前用户
//                    User user = (User) context.getAuthentication().getPrincipal(); //获取springSecurity内部的user类
//                    String username = user.getUsername();
                    String username = UserUtils.findUserName();

                    //将日志信息封装到SysLog对象中
                    SysLog sysLog = new SysLog();
                    sysLog.setId(UUIDUtils.getUUID32());
                    sysLog.setExecutionTime(time);
                    sysLog.setIp(ip);
                    sysLog.setMethod("[类名]: "+executionClass.getName()+"   [方法名]: "+executionMethod.getName());
                    sysLog.setUrl(url);
                    sysLog.setUsername(username);
                    sysLog.setVisitTime(startTime);

                    //调用service完成操作
                    if (!executionClass.getName().contains("SysLogController")){
                        sysLogService.save(sysLog);
                    }

                }


            }
        }
    }
}
