package servlets;

import entity.*;
import service.PatientService;
import service.imp.PatientServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/financialServlet")
public class FinancialServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        PatientService service = new PatientServiceImpl();
        List<Finance1> finances1 = service.findFinancial();
        List<Finance2> finances2 = service.findDeptCost();
        List<DeptNum> dns = service.findPatientCure();
        request.setAttribute("f1",finances1);
        request.setAttribute("f2",finances2);
        request.setAttribute("dns",dns);



        //表格代码
        //1.获取参数
        String currentPage = request.getParameter("currentPage");//当前页码
        String rows = request.getParameter("rows");//每页显示条数

        if(currentPage == null || "".equals(currentPage)){

            currentPage = "1";
        }
        if(rows == null || "".equals(rows)){
            rows = "10";
        }

        //2.调用service查询
        PageBean<Alter> pb = service.findAlterByPage(currentPage,rows);

        //3.将PageBean存入request
        request.setAttribute("pb",pb);


        request.getRequestDispatcher("/financial.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
