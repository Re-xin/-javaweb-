package servlets;

import entity.Patient;
import service.PatientService;
import service.imp.PatientServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@WebServlet("/findPatientServlet")
public class FindPatientServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        PatientService service = new PatientServiceImpl();

        Patient patient = service.findPatientById(id);

        request.setAttribute("patient",patient);
        Date date = new Date();
        SimpleDateFormat sj = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DATE,-10);
        String str = sj.format(calendar.getTime());
        request.setAttribute("str",str);


        String mark = request.getParameter("mark");
        if (mark.equals("1")){
            request.getRequestDispatcher("/patientInfoAuto.jsp").forward(request,response);
        }
        if (mark.equals("2")){
            request.getRequestDispatcher("/patientInfo.jsp").forward(request,response);
        }




    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
