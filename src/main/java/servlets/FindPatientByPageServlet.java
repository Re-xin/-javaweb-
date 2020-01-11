package servlets;

import entity.PageBean;
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
import java.util.Map;

@WebServlet("/findPatientByPageServlet")
public class FindPatientByPageServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        //1.获取参数
        String currentPage = request.getParameter("currentPage");//当前页码
        String rows = request.getParameter("rows");//每页显示条数

        if(currentPage == null || "".equals(currentPage)){

            currentPage = "1";
        }


        if(rows == null || "".equals(rows)){
            rows = "10";
        }


        Map<String, String[]> condition = request.getParameterMap();
        request.setAttribute("condition",condition);
        //2.调用service查询
        PatientService service = new PatientServiceImpl();
        PageBean<Patient> pb = service.findPatientByPage(currentPage,rows,condition);

        //3.将PageBean存入request
        request.setAttribute("pb",pb);

        Date date = new Date();
        SimpleDateFormat sj = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DATE,-10);
        String str = sj.format(calendar.getTime());
        request.setAttribute("str",str);//10天前
        request.setAttribute("a_state","出院");
        //4.转发到list.jsp
        request.getRequestDispatcher("/list.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
