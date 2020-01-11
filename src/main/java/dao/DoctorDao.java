package dao;

import entity.Doctor;

import java.sql.SQLException;

public interface DoctorDao {
    Doctor findDoctorByUsernameAndPassword(String loginname, String pwd) throws SQLException;

    String register(Doctor doctor);
}
