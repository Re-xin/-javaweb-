package servlets;

import service.PatientService;
import service.imp.PatientServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/rechargeServlet")
public class RechargeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String recharge = request.getParameter("recharge");
        request.setAttribute("id",id);
        request.setAttribute("name",name);
        request.setAttribute("recharge",recharge);

        PatientService service = new PatientServiceImpl();
        String recharge_msg = service.recharge(id,name,recharge);

        request.setAttribute("recharge_msg",recharge_msg);

        request.getRequestDispatcher("/patientrecharge.jsp").forward(request,response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
