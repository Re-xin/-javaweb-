package service.imp;


import dao.DoctorDao;
import dao.imp.DoctorDaoImpl;
import entity.Doctor;
import service.DoctorService;

import java.sql.SQLException;

public class DoctorServiceImpl implements DoctorService {
    DoctorDao dao = new DoctorDaoImpl();

    @Override
    public Doctor login(Doctor doctor) {
        try {
            return dao.findDoctorByUsernameAndPassword(doctor.getLoginname(),doctor.getPwd());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public String register(Doctor doctor) {
        return dao.register(doctor);
    }
}
