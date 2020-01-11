package servlets;

import entity.Patient;
import org.apache.commons.beanutils.BeanUtils;
import service.PatientService;
import service.imp.PatientServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");

        Map<String, String[]> map =request.getParameterMap();
        Patient patient = new Patient();
        patient.setState("预约挂号");
        try {
            //得到了名字，性别，年龄，电话，临床科室
            BeanUtils.populate(patient,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        PatientService service = new PatientServiceImpl();
        //插入成功返回成功，失败返回失败
        String register = service.register(patient);

        HttpSession session = request.getSession();
        session.setAttribute("register",register);

        response.sendRedirect(request.getContextPath()+"/register.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
