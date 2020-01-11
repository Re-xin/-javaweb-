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
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

@WebServlet("/updateServlet")
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String mark = request.getParameter("mark");
        Map<String, String[]> map = request.getParameterMap();
        Patient patient = new Patient();

        String bbed = request.getParameter("bbed");
        String bexpenses = request.getParameter("bexpenses");
        String cause = request.getParameter("cause");



        try {
            BeanUtils.populate(patient,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        //把增加医疗费的加上去，还有病床也得改变

        if(bexpenses != null && !bexpenses.equals("")){
            patient.setExpenses(patient.getExpenses()+Integer.parseInt(bexpenses));
        }
        if(bbed != null && !bbed.equals("")){
            patient.setBed(Integer.parseInt(bbed));
        }


        if(mark == null){
            PatientService service = new PatientServiceImpl();
            service.updatePatient(patient);
        }else if(mark.equals("2")){
            PatientService service = new PatientServiceImpl();
            service.leave(patient,mark);
        }else if (mark.equals("3")){
            PatientService service = new PatientServiceImpl();
            service.leave(patient,mark);
        }

        //床位和资金流动情况



        if(bbed != null && bexpenses != null){
            PatientService service = new PatientServiceImpl();
            service.insertAlter(patient,bbed,bexpenses,cause);
        }



//        request.getRequestDispatcher("/patientListServlet").forward(request,response);
        response.sendRedirect(request.getContextPath()+"/findPatientByPageServlet");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
