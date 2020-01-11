package dao.imp;

import dao.PatientDao;
import entity.*;
import util.MyDateSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;


public class PatientDaoImpl implements PatientDao {
    @Override
    public String register(Patient patient) {
        PreparedStatement pstmt = null;
        Connection conn = null;
        boolean flag = true;

        conn = MyDateSource.getConnection();
        String sql = "insert into patient values(null,?,?,?,?,?,null,null,?,null,null,null,null)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setObject(1,patient.getName());
            pstmt.setObject(2,patient.getSex());
            pstmt.setObject(3,patient.getAge());
            pstmt.setObject(4,patient.getDel());
            pstmt.setObject(5,patient.getState());
            pstmt.setObject(6,patient.getDepartment());

            flag = pstmt.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if (flag == false){
                //插入成功
                return "预约成功！";
            }else {
                return "预约失败，请重试";
            }
        }




    }

    @Override
    public List<Patient> findAll()  {
        PreparedStatement pstmt = null;
        List<Patient> list = new ArrayList<>();
        Connection conn = null;
        String sql = "SELECT * FROM patient";
        conn = MyDateSource.getConnection();

        try {
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                Patient patient = new Patient();
                patient.setId((Integer) rs.getObject(1));
                patient.setName((String) rs.getObject(2));
                patient.setSex((String) rs.getObject(3));
                patient.setAge((Integer) rs.getObject(4));
                patient.setDel((String) rs.getObject(5));
                patient.setState((String) rs.getObject(6));
                patient.setAtime((Date) rs.getObject(7));
                patient.setBtime((Date) rs.getObject(8));
                patient.setDepartment((String) rs.getObject(9));
                patient.setBed(rs.getByte(10));
                patient.setDeposit(rs.getInt(11));
                patient.setExpenses(rs.getInt(12));
                patient.setRecharge(rs.getInt(13));
                list.add(patient);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public Patient findPatientById(int id) {
        PreparedStatement pstmt = null;
        Connection conn = null;
        String sql = "select * from patient where id = ?";
        conn = MyDateSource.getConnection();
        Patient patient = new Patient();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setObject(1,id);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                patient.setId((Integer) rs.getObject(1));
                patient.setName((String) rs.getObject(2));
                patient.setSex((String) rs.getObject(3));
                patient.setAge((Integer) rs.getObject(4));
                patient.setDel((String) rs.getObject(5));
                patient.setState((String) rs.getObject(6));
                patient.setAtime((Date) rs.getObject(7));
                patient.setBtime((Date) rs.getObject(8));
                patient.setDepartment((String) rs.getObject(9));
                patient.setBed(rs.getByte(10));
                patient.setDeposit(rs.getInt(11));
                patient.setExpenses(rs.getInt(12));
                patient.setRecharge(rs.getInt(13));
                return patient;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }


        return patient;
    }

    @Override
    public void updatePatient(Patient patient) {
        PreparedStatement pstmt = null;
        Connection conn = null;
        conn = MyDateSource.getConnection();

        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date d = new Date();
        String date = df.format(d);
        String sql = "UPDATE patient SET NAME = ?, sex = ?,age = ? ,del = ? ,state = ? , atime = ? ,department = ? , bed = ? ,deposit= ? ,expenses = ? WHERE id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setObject(1,patient.getName());
            pstmt.setObject(2,patient.getSex());
            pstmt.setInt(3,patient.getAge());
            pstmt.setObject(4,patient.getDel());
            pstmt.setObject(5,patient.getState());
            pstmt.setObject(6,date);
            pstmt.setObject(7,patient.getDepartment());
            pstmt.setInt(8,patient.getBed());
            pstmt.setInt(9,patient.getDeposit());
            pstmt.setInt(10,patient.getExpenses());
            pstmt.setInt(11,patient.getId());
            pstmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    @Override
    public void deletePatient(int id) {
        String sql = "DELETE FROM patient WHERE id = ?";

        PreparedStatement pstmt = null;
        Connection conn = null;
        conn = MyDateSource.getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,id);
            pstmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public int findTotalCount(Map<String, String[]> condition) {
        PreparedStatement pstmt = null;
        Connection conn = null;
        conn = MyDateSource.getConnection();
        ResultSet rs = null;
        int count = 0;
        //1.定义模板初始化sql
        String sql = "select * from Patient where 1 = 1 ";

        //条件查询部分
        StringBuilder sb = new StringBuilder(sql);
        Set<String> keySet = condition.keySet();

        List<Object> params = new ArrayList<Object>();
        for (String key : keySet) {
            //排除分页条件参数
            if("currentPage".equals(key) || "rows".equals(key)){
                continue;
            }

            //获取value
            String value = condition.get(key)[0];
            if(value !=null && !"".equals(value)){
                //判断是不是区间数字1
                if(key.equals("age1") || key.equals("deposit1") || key.equals("expenses1") || key.equals("recharge1")){
                    sb.append(" and "+key.substring(0,key.length()-1)+" >= ? ");
                    params.add(value);
                    continue;
                }else if(key.equals("age2") || key.equals("deposit2") || key.equals("expenses2") || key.equals("recharge2")){
                    sb.append(" and "+key.substring(0,key.length()-1)+" <= ? ");
                    params.add(value);
                    continue;
                }
                sb.append(" and "+key+" like ? ");
                params.add("%"+value+"%");
            }
        }
        String sqlstr = sb.toString();

        int index = 0;
        try {
            pstmt = conn.prepareStatement(sqlstr);
            if(params != null && params.size() > 0){
                for (Object param : params) {
                    index++;
                    pstmt.setObject(index,param);
                }
            }
            rs = pstmt.executeQuery();
            rs.last();
            count = rs.getRow();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    @Override
    public List<Patient> findByPage(int start, int rows, Map<String, String[]> condition) {
        String sql = "select * from patient where 1 = 1";
        List<Patient> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        Connection conn = null;
        conn = MyDateSource.getConnection();
        System.out.println(conn);
        //条件查询部分
        StringBuilder sb = new StringBuilder(sql);
        Set<String> keySet = condition.keySet();

        List<Object> params = new ArrayList<Object>();
        for (String key : keySet) {
            //排除分页条件参数
            if("currentPage".equals(key) || "rows".equals(key)){
                continue;
            }

            //获取value
            String value = condition.get(key)[0];
            if(value !=null && !"".equals(value)){
                //判断是不是区间数字
                if(key.equals("age1") || key.equals("deposit1") || key.equals("expenses1") || key.equals("recharge1")){
                    sb.append(" and "+key.substring(0,key.length()-1)+" >= ? ");
                    params.add(value);
                    continue;
                }else if(key.equals("age2") || key.equals("deposit2") || key.equals("expenses2") || key.equals("recharge2")){
                    sb.append(" and "+key.substring(0,key.length()-1)+" <= ? ");
                    params.add(value);
                    continue;
                }
                sb.append(" and "+key+" like ? ");
                params.add("%"+value+"%");
            }
        }

        sb.append(" limit ? , ? ");
        String sqlstr = sb.toString();


        int index = 0;
        try {
            pstmt = conn.prepareStatement(sqlstr);
            if(params != null && params.size() > 0){
                for (Object param : params) {
                    index++;
                    pstmt.setObject(index,param);
                }
            }
            index++;
            pstmt.setInt(index,start);
            index++;
            pstmt.setInt(index,rows);

            System.out.println(sqlstr);
            System.out.println(params);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                Patient patient = new Patient();
                patient.setId((Integer) rs.getObject(1));
                patient.setName((String) rs.getObject(2));
                patient.setSex((String) rs.getObject(3));
                patient.setAge((Integer) rs.getObject(4));
                patient.setDel((String) rs.getObject(5));
                patient.setState((String) rs.getObject(6));
                patient.setAtime((Date) rs.getObject(7));
                patient.setBtime((Date) rs.getObject(8));
                patient.setDepartment((String) rs.getObject(9));
                patient.setBed(rs.getByte(10));
                patient.setDeposit(rs.getInt(11));
                patient.setExpenses(rs.getInt(12));
                patient.setRecharge(rs.getInt(13));
                list.add(patient);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Patient findPatientByIdName(int id, String name) {
        PreparedStatement pstmt = null;
        Connection conn = null;
        String sql = "select * from patient where id = ? and name = ?";
        conn = MyDateSource.getConnection();
        Patient patient = new Patient();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setObject(1,id);
            pstmt.setObject(2,name);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                patient.setId((Integer) rs.getObject(1));
                patient.setName((String) rs.getObject(2));
                patient.setSex((String) rs.getObject(3));
                patient.setAge((Integer) rs.getObject(4));
                patient.setDel((String) rs.getObject(5));
                patient.setState((String) rs.getObject(6));
                patient.setAtime((Date) rs.getObject(7));
                patient.setBtime((Date) rs.getObject(8));
                patient.setDepartment((String) rs.getObject(9));
                patient.setBed(rs.getByte(10));
                patient.setDeposit(rs.getInt(11));
                patient.setExpenses(rs.getInt(12));
                patient.setRecharge(rs.getInt(13));
            }else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return patient;

    }

    @Override
    public String recharge(int id, String name, int recharge) {
        PreparedStatement pstmt = null;
        Connection conn = null;
        int flag = 0;

        conn = MyDateSource.getConnection();
        String sql = "UPDATE patient SET recharge = recharge + ? WHERE id = ? AND NAME = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,recharge);
            pstmt.setInt(2,id);
            pstmt.setObject(3,name);

            flag = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if (flag == 1){
                //插入成功
                return "充值成功！";
            }else {
                return "充值失败，请输入正确的病历号和名字";
            }
        }
    }

    @Override
    public void leave(Patient patient, String mark) {
        PreparedStatement pstmt = null;
        Connection conn = null;
        conn = MyDateSource.getConnection();

        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date d = new Date();
        String date = df.format(d);
        String sql = "UPDATE patient SET state = ? , btime = ? , recharge = ? , bed = null WHERE id = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setObject(1,"出院");
            pstmt.setObject(2,date);
            if(mark.equals("2")){
                //安排出院，退还医疗费
                pstmt.setInt(3,patient.getExpenses());
            }else {
                //请出医院，收取押金
                pstmt.setInt(3,patient.getRecharge());
            }
            pstmt.setObject(4,patient.getId());
            pstmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public int findNullBed() {
        PreparedStatement pstmt = null;
        Connection conn = null;
        String sql = "SELECT * FROM patient";
        conn = MyDateSource.getConnection();

        try {
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            rs.last();
            int lastrow = rs.getRow();
            rs.first();
            for(int i = 1;;i++){
                while (rs.next()){
                    if (i == rs.getInt("bed")){
                        break;
                    }else if(rs.getRow() == lastrow){
                        return i;
                    }
                }
                rs.first();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return 0;
    }

    @Override
    public List<Finance1> findFinancial() {
        PreparedStatement pstmt = null;
        Connection conn = null;
        String sql = "SELECT YEAR(atime),MONTH(atime),SUM(expenses),SUM(recharge) FROM patient GROUP BY YEAR(atime), MONTH(atime)";
        conn = MyDateSource.getConnection();
        List<Finance1> finances1 = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            while (rs.next()){
                Finance1 finance1 = new Finance1();
                finance1.setYear((Integer) rs.getObject(1));
                finance1.setMonth((Integer) rs.getObject(2));
                finance1.setCost(Integer.parseInt(rs.getObject(3).toString()));
                if(rs.getObject(4) != null ){
                    finance1.setCollect(Integer.parseInt(rs.getObject(4).toString()));
                }else {
                    finance1.setCollect(0);
                }

                finances1.add(finance1);
            }
            return finances1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Finance2> findDeptCost() {
        PreparedStatement pstmt = null;
        Connection conn = null;
        String sql = "SELECT department,SUM(expenses) FROM patient GROUP BY department";
        conn = MyDateSource.getConnection();
        List<Finance2> finances2 = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                Finance2 finance2 = new Finance2();
                finance2.setDepartment((String) rs.getObject(1));
                finance2.setDeptecost(Integer.parseInt(rs.getObject(2).toString()));
                finances2.add(finance2);
            }
            return finances2;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int findAlterCount() {
        PreparedStatement pstmt = null;
        Connection conn = null;
        conn = MyDateSource.getConnection();
        ResultSet rs = null;
        //1.定义模板初始化sql
        String sql = "select * from Alters";

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            rs.last();
            return rs.getRow();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public List<Alter> findAlterByPage(int start, int rows) {
        PreparedStatement pstmt = null;
        Connection conn = null;
        conn = MyDateSource.getConnection();
        ResultSet rs = null;
        List<Alter> list = new ArrayList<>();
        String sql = "select * from Alters limit ? , ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setObject(1,start);
            pstmt.setObject(2,rows);
            rs = pstmt.executeQuery();
            while (rs.next()){
                Alter alter = new Alter();
                alter.setId((Integer) rs.getObject(1));
                alter.setName((String) rs.getObject(2));
                if (rs.getObject(3) != null){
                    alter.setAbed((Integer) rs.getObject(3));
                }
                if (rs.getObject(4) != null){
                    alter.setBbed((Integer) rs.getObject(4));
                }
                alter.setBedtime((Date) rs.getObject(5));
                if (rs.getObject(6) != null){
                    alter.setAexpenses((Integer) rs.getObject(6));
                }
                if (rs.getObject(7) != null){
                    alter.setBexpenses((Integer) rs.getObject(7));
                }
                if (rs.getObject(8) != null){
                    alter.setCause((String) rs.getObject(8));
                }

                alter.setExpensestime((Date) rs.getObject(9));
                list.add(alter);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return null;
    }

    @Override
    public void insertAlter(Patient patient, String bbed, String bexpenses, String cause) {
        PreparedStatement pstmt = null;
        Connection conn = null;
        conn = MyDateSource.getConnection();
        ResultSet rs = null;
        String sql = "insert into alters values(?,?,?,?,?,?,?,?,?)";
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date d = new Date();
        String date = df.format(d);
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,patient.getId());
            pstmt.setObject(2,patient.getName());
            if(bbed != null && !bbed.equals("")){
                pstmt.setInt(3,patient.getBed());
                pstmt.setInt(4,Integer.parseInt(bbed));
                pstmt.setObject(5,date);

            }else {
                pstmt.setObject(3,null);
                pstmt.setObject(4,null);
                pstmt.setObject(5,null);
            }
            if(bexpenses != null && !bexpenses.equals("")){
                pstmt.setInt(6,patient.getExpenses());
                pstmt.setInt(7,Integer.parseInt(bexpenses));
                pstmt.setObject(8,cause);

                pstmt.setObject(9,date);

            }else {
                pstmt.setObject(6,null);
                pstmt.setObject(7,null);
                pstmt.setObject(8,null);
                pstmt.setObject(9,null);
            }

            pstmt.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<PatientCure> findPatientCost(String id, String name) {
        PreparedStatement pstmt = null;
        Connection conn = null;
        conn = MyDateSource.getConnection();
        ResultSet rs = null;
        List<PatientCure> list = new ArrayList<>();
        String sql = "SELECT cause,bexpenses FROM alters WHERE id = ? AND NAME = ?";
        try {

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,Integer.parseInt(id));
            pstmt.setObject(2,name);
            rs = pstmt.executeQuery();
            while(rs.next()){
                if(rs.getObject(1) != null || rs.getObject(2) != null){
                    PatientCure pc = new PatientCure();
                    pc.setCause((String) rs.getObject(1));
                    pc.setExpenses((Integer) rs.getObject(2));
                    list.add(pc);
                }
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<DeptNum> findPatientCure() {
        PreparedStatement pstmt = null;
        Connection conn = null;
        conn = MyDateSource.getConnection();
        ResultSet rs = null;
        List<DeptNum> list = new ArrayList<>();
        String sql = "SELECT department,COUNT(department) FROM patient GROUP BY department";

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()){
                DeptNum dn = new DeptNum();
                dn.setDepartment((String) rs.getObject(1));
                dn.setCount(rs.getInt(2));
                list.add(dn);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
