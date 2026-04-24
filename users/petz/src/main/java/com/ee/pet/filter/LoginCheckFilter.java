package com.ee.pet.filter;//package com.shy.pet.filter;
//
//
//import com.shy.pet.common.BaseContext;
//import com.shy.pet.common.R;
//import jakarta.servlet.*;
//import jakarta.servlet.annotation.WebFilter;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.util.AntPathMatcher;
//
//
//import java.io.IOException;
//
//import static org.apache.logging.log4j.message.MapMessage.MapFormat.JSON;
//
///*检查用户是否完成登录*/
//@WebFilter(filterName = "loginCheckFilter",urlPatterns = "/*")
//@Slf4j
//public class LoginCheckFilter implements Filter {
//    //路径匹配器，可以匹配通配符
//    public static final AntPathMatcher PATH_MATCHER=new AntPathMatcher();
//    @Override
//    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws ServletException, IOException, ServletException {
//        HttpServletRequest request=(HttpServletRequest) servletRequest;
//        HttpServletResponse response=(HttpServletResponse) servletResponse;
//        //1.获取本次请求的URI
//        String requestURI = request.getRequestURI();
//        log.info("拦截到请求：{}",requestURI);
//        //定义不需要处理的请求路径
//        String[] urls=new String[]{
////          "/employee/login",
////          "/employee/logout",
////          "/backend/**",
////          "/front/**",
////          "/common/**",
////          "/user/sendMsg",//移动端登录发送短信
////          "/user/login"//移动端登录
//            "/users/elogin",
//                "/users/plogin",
//            "/users/sendcode",
//            "/users/register"
//        };
//        //2.判断本次请求是否需要处理
//        boolean check=check(urls,requestURI);
//        //3.如果不需要处理则直接放行
//        if (check){
//            log.info("本次请求{}不需要处理",requestURI);
//            filterChain.doFilter(request,response);
//            return;
//        }
//        //4.1判断登录状态，如果已经登录，则直接放行
//        if (request.getSession().getAttribute("employee")!=null){
//            log.info("用户已登录，用户ID为：{}",request.getSession().getAttribute("employee"));
//
//            Long empId=(Long)request.getSession().getAttribute("employee");
//            BaseContext.setCurrentId(empId);
//
//            filterChain.doFilter(request,response);
//            return;
//        }
//
//        //4.2判断登录状态，如果已经登录，则直接放行
//        if (request.getSession().getAttribute("users")!=null){
//            log.info("用户已登录，用户ID为：{}",request.getSession().getAttribute("users"));
//
//            Long userId=(Long)request.getSession().getAttribute("users");
//            BaseContext.setCurrentId(userId);
//
//            filterChain.doFilter(request,response);
//            return;
//        }
//
//        log.info("用户未登录");
//        //5.如果未登录则返回未登录结果，通过输出流方式向客户端页面响应数据
////        response.getWriter().write(JSON.toJSONString(R.error("NOTLOGIN")));
//        return;
//    }
//    /*
//    * 路径匹配，检查本次请求是否需要放行
//    * @param urls
//    * @param requestURI
//    * @return
//    * */
//    public boolean check(String[] urls,String requestURI){
//        for (String url : urls){
//            boolean match=PATH_MATCHER.match(url,requestURI);
//            if(match){
//                return true;
//            }
//        }
//        return false;
//    }
//}
