package dao.imp;

import dao.DoctorDao;
import entity.Doctor;
import util.MyDateSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DoctorDaoImpl implements DoctorDao {



    @Override
    public Doctor findDoctorByUsernameAndPassword(String loginname, String pwd)  {
        PreparedStatement pstmt = null;
        Connection conn = null;
        ResultSet rs = null;
        Doctor doctor = new Doctor();

        try{
            conn = MyDateSource.getConnection();

            String sql = "select * from doctor where loginname = ? and pwd = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setObject(1,loginname);
            pstmt.setObject(2,pwd);

            rs = pstmt.executeQuery();
            if(rs.next()){
                doctor.setName(rs.getString(1));
                doctor.setLoginname(loginname);
                doctor.setPwd(pwd);
                return doctor;
            }else {
                return null;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public String register(Doctor doctor) {
        PreparedStatement pstmt = null;
        Connection conn = MyDateSource.getConnection();;
        ResultSet rs = null;
        boolean flag = true;

        String sql = "INSERT INTO doctor VALUES(?,?,?)";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setObject(1,doctor.getName());
            pstmt.setObject(2,doctor.getLoginname());
            pstmt.setObject(3,doctor.getPwd());
            flag = pstmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if (flag == false){
                //插入成功
                return "注册成功！";
            }else {
                return "注册失败，请重试";
            }
        }

    }
}
