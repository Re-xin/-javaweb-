package entity;

//Finance.jsp里面插图2的实体类
public class Finance2 {
    private String department;
    private int deptecost;

    public Finance2() {
    }

    public Finance2(String department, int deptecost) {
        this.department = department;
        this.deptecost = deptecost;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public int getDeptecost() {
        return deptecost;
    }

    public void setDeptecost(int deptecost) {
        this.deptecost = deptecost;
    }
}
