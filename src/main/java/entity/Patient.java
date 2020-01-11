package entity;

import java.util.Date;

public class Patient {
    private int id;
    private String name;
    private String sex;
    private int age;
    private String del;//电话
    private String state;//状态
    private Date atime;//入院时间
    private Date btime;//出院时间
    private String department;//临床科室
    private int bed;//病床床位
    private int deposit;//押金
    private int expenses;//需交医疗费
    private int recharge;//已交医疗费




    public Patient() {
    }

    public Patient(int id, String name, String sex, int age, String del, String state, Date atime, Date btime, String department, int bed, int deposit, int expenses, int recharge) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.age = age;
        this.del = del;
        this.state = state;
        this.atime = atime;
        this.btime = btime;
        this.department = department;
        this.bed = bed;
        this.deposit = deposit;
        this.expenses = expenses;
        this.recharge = recharge;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getDel() {
        return del;
    }

    public void setDel(String del) {
        this.del = del;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Date getAtime() {
        return atime;
    }

    public void setAtime(Date atime) {
        this.atime = atime;
    }

    public Date getBtime() {
        return btime;
    }

    public void setBtime(Date btime) {
        this.btime = btime;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public int getBed() {
        return bed;
    }

    public void setBed(int bed) {
        this.bed = bed;
    }

    public int getDeposit() {
        return deposit;
    }

    public void setDeposit(int deposit) {
        this.deposit = deposit;
    }

    public int getExpenses() {
        return expenses;
    }

    public void setExpenses(int expenses) {
        this.expenses = expenses;
    }

    public int getRecharge() {
        return recharge;
    }

    public void setRecharge(int recharge) {
        this.recharge = recharge;
    }
}
