package servlets;

import entity.Doctor;
import org.apache.commons.beanutils.BeanUtils;
import service.DoctorService;
import service.imp.DoctorServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Map;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        String verifycode = request.getParameter("verifycode");

        HttpSession session = request.getSession();
        //确保验证码一次性
        String checkcode_server = (String) session.getAttribute("CHECKCODE_SERVER");
        session.removeAttribute("CHECKCODE_SERVER");
        //确保验证码一次性

        if(!checkcode_server.equalsIgnoreCase(verifycode)){
            //验证码错误
            request.setAttribute("login_msg","验证码错误！");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
            return;
        }


//        String loginname = request.getParameter("loginname");
//        String pwd = request.getParameter("pwd");
//        Doctor doctor = new Doctor();
//        doctor.setLoginname(loginname);
//        doctor.setPwd(pwd);
        //↑↓一样功能的代码
        Map<String, String[]> map =request.getParameterMap();
        Doctor doctor = new Doctor();
        try {
            BeanUtils.populate(doctor,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }


        try {
            DoctorService service = new DoctorServiceImpl();
            Doctor loginDoctor = service.login(doctor);
            if (loginDoctor != null){
                //登入成功
                session.setAttribute("loginDoctor",loginDoctor);
                response.sendRedirect(request.getContextPath()+"/index.jsp");
            }else {
                request.setAttribute("login_msg","用户名或密码错误");
                request.getRequestDispatcher("/login.jsp").forward(request,response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request,response);
    }
}
