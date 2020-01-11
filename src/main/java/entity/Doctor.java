package entity;

public class Doctor {
    private String name;
    private String loginname;
    private String pwd;

    public Doctor(String name, String loginname, String pwd) {
        this.name = name;
        this.loginname = loginname;
        this.pwd = pwd;
    }

    public Doctor() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLoginname() {
        return loginname;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
}
