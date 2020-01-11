package dao;

import entity.*;

import java.util.List;
import java.util.Map;

public interface PatientDao {
    String register(Patient patient);

    List<Patient> findAll();

    Patient findPatientById(int parseInt);

    void updatePatient(Patient patient);

    void deletePatient(int parseInt);

    /**
     * 查询总记录数
     * @return
     * @param condition
     */
    int findTotalCount(Map<String, String[]> condition);

    /**
     * 分页查询每页记录
     * @param start
     * @param rows
     * @param condition
     * @return
     */
    List<Patient> findByPage(int start, int rows, Map<String, String[]> condition);

    Patient findPatientByIdName(int parseInt, String name);

    String recharge(int parseInt, String name, int parseInt1);

    void leave(Patient patient, String mark);

    int findNullBed();

    List<Finance1> findFinancial();

    List<Finance2> findDeptCost();

    int findAlterCount();

    List<Alter> findAlterByPage(int start, int rows);

    void insertAlter(Patient patient, String parseInt, String parseInt1,String cause);

    List<PatientCure> findPatientCost(String id, String name);

    List<DeptNum> findPatientCure();
}
