package service.imp;

import dao.PatientDao;
import dao.imp.PatientDaoImpl;
import entity.*;
import service.PatientService;

import java.util.List;
import java.util.Map;

public class PatientServiceImpl implements PatientService {
    PatientDao dao = new PatientDaoImpl();

    @Override
    public String register(Patient patient) {
        return dao.register(patient);
    }

    @Override
    public List<Patient> findAll() {
        return dao.findAll();
    }

    @Override
    public Patient findPatientById(String id) {
        return dao.findPatientById(Integer.parseInt(id));
    }

    @Override
    public void updatePatient(Patient patient) {
        dao.updatePatient(patient);
    }

    @Override
    public void deletePatient(String id) {
        dao.deletePatient(Integer.parseInt(id));
    }

    @Override
    public void delSelectedPatients(String[] ids) {
        if (ids !=null && ids.length > 0) {
            for (String id : ids) {
                dao.deletePatient(Integer.parseInt(id));
            }
        }




    }

    @Override
    public PageBean<Patient> findPatientByPage(String _currentPage, String _rows, Map<String, String[]> condition) {

        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);

        if(currentPage <=0) {
            currentPage = 1;
        }
        if(currentPage >= 0){

        }

        //1.创建空的PageBean对象
        PageBean<Patient> pb = new PageBean<Patient>();
        //2.设置参数
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);

        //3.调用dao查询总记录数
        int totalCount = dao.findTotalCount(condition);

        pb.setTotalCount(totalCount);
        //4.调用dao查询List集合
        //计算开始的记录索引
        int start = (currentPage - 1) * rows;

        List<Patient> list = dao.findByPage(start,rows,condition);
        pb.setList(list);

        //5.计算总页码
        int totalPage = (totalCount % rows)  == 0 ? totalCount/rows : (totalCount/rows) + 1;
        pb.setTotalPage(totalPage);


        return pb;
    }

    @Override
    public Patient findPatientByIdName(String id, String name) {
        return dao.findPatientByIdName(Integer.parseInt(id),name);
    }

    @Override
    public String recharge(String id, String name, String recharge) {
        return dao.recharge(Integer.parseInt(id),name,Integer.parseInt(recharge));
    }

    @Override
    public void leave(Patient patient, String mark) {
        dao.leave(patient,mark);
    }

    @Override
    public int findNullBed() {
        return dao.findNullBed();
    }

    @Override
    public List<Finance1> findFinancial() {
        return dao.findFinancial();
    }

    @Override
    public List<Finance2> findDeptCost() {
        return dao.findDeptCost();
    }

    @Override
    public PageBean<Alter> findAlterByPage(String _currentPage, String _rows) {
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);

        if(currentPage <=0) {
            currentPage = 1;
        }
        if(currentPage >= 0){

        }

        //1.创建空的PageBean对象
        PageBean<Alter> pb = new PageBean<Alter>();
        //2.设置参数
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);

        //3.调用dao查询总记录数
        int totalCount = dao.findAlterCount();

        pb.setTotalCount(totalCount);
        //4.调用dao查询List集合
        //计算开始的记录索引
        int start = (currentPage - 1) * rows;

        List<Alter> list = dao.findAlterByPage(start,rows);
        pb.setList(list);

        //5.计算总页码
        int totalPage = (totalCount % rows)  == 0 ? totalCount/rows : (totalCount/rows) + 1;
        pb.setTotalPage(totalPage);

        return pb;
    }

    @Override
    public void insertAlter(Patient patient, String bbed, String bexpenses, String cause) {
        dao.insertAlter(patient,bbed, bexpenses, cause);
    }

    @Override
    public List<PatientCure> findPatientCost(String id, String name) {
        return dao.findPatientCost(id, name);
    }

    @Override
    public List<DeptNum> findPatientCure() {
        return dao.findPatientCure();
    }


}

