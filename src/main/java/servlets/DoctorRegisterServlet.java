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
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/doctorRegisterServlet")
public class DoctorRegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        Map<String, String[]> map = request.getParameterMap();
        Doctor doctor = new Doctor();

        try {
            BeanUtils.populate(doctor,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        DoctorService service = new DoctorServiceImpl();
        String message = service.register(doctor);

        request.setAttribute("login_msg",message);
        request.getRequestDispatcher("/doctorregister.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
