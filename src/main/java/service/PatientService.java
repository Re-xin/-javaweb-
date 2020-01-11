package service;

import entity.*;

import java.util.List;
import java.util.Map;

public interface PatientService {
    String register(Patient patient);

    List<Patient> findAll();

    Patient findPatientById(String id);

    void updatePatient(Patient patient);

    void deletePatient(String id);

    void delSelectedPatients(String[] ids);

    PageBean<Patient> findPatientByPage(String currentPage, String rows, Map<String, String[]> condition);

    Patient findPatientByIdName(String id, String name);

    String recharge(String id, String name, String recharge);

    void leave(Patient patient, String mark);

    int findNullBed();

    List<Finance1> findFinancial();

    List<Finance2> findDeptCost();

    PageBean<Alter> findAlterByPage(String currentPage, String rows);

    void insertAlter(Patient patient, String bbed, String bexpenses, String cause);


    List<PatientCure> findPatientCost(String id, String name);

    List<DeptNum> findPatientCure();
}
