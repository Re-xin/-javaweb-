package service;

import entity.Doctor;

import java.sql.SQLException;

public interface DoctorService {
    Doctor login(Doctor doctor) throws SQLException;

    String register(Doctor doctor);
}
