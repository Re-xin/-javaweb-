package servlets;

import entity.Finance1;
import entity.Patient;
import entity.PatientCure;
import service.PatientService;
import service.imp.PatientServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/patientSearchServlet")
public class PatientSearchServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        request.setAttribute("pid",id);
        request.setAttribute("pname",name);
        Patient patient =null;

        if(id != null && name != null){
            PatientService service = new PatientServiceImpl();
            patient = service.findPatientByIdName(id,name);
        }

        if (patient == null) {
            request.setAttribute("ps_msg","查询失败，请输入正确的病历号和姓名");
        }else {
            request.setAttribute("patient",patient);
        }

        PatientService service = new PatientServiceImpl();

        List<PatientCure> list = service.findPatientCost(id,name);


        request.setAttribute("list",list);

        request.getRequestDispatcher("/patientsearch.jsp").forward(request,response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
