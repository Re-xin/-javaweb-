package Filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * 登录验证的过滤器
 */
@WebFilter("/*")
public class LoginFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //0.强制转换
        HttpServletRequest request = (HttpServletRequest) req;
        //1.获取资源请求路径
        String uri = request.getRequestURI();

        //2.判断是否包含登录相关资源路径
        if(uri.contains("/financial.jsp")||uri.contains("/financialServlet")||uri.contains("/findPatientByPageServlet")||uri.contains("/findPatientServlet")||uri.contains("/list.jsp")    ){
            //包含，用户是医生，判断有没有登入，有就放行，没有就去登入
            Object doctor = request.getSession().getAttribute("loginDoctor");
            if(doctor != null){
                //登录了。放行
                chain.doFilter(req, resp);
            }else{
                //没有登录。跳转登录页面
                request.setAttribute("login_msg","您尚未登录，请登录");
                request.getRequestDispatcher("/login.jsp").forward(request,resp);
            }
        }else{
            //不包含，不是医生登入，放行
            chain.doFilter(req, resp);
        }
        // chain.doFilter(req, resp);
    }
    @Override
    public void init(FilterConfig config) throws ServletException {

    }
    @Override
    public void destroy() {
    }

}
