package entity;

import java.util.Date;

public class Alter {
    private int id;
    private String name;
    private int abed;
    private int bbed;
    private Date bedtime;
    private int aexpenses;
    private int bexpenses;
    private String cause;
    private Date expensestime;




    public Alter() {
    }

    public Alter(int id, String name, int abed, int bbed, Date bedtime, int aexpenses, int bexpenses, String cause, Date expensestime) {
        this.id = id;
        this.name = name;
        this.abed = abed;
        this.bbed = bbed;
        this.bedtime = bedtime;
        this.aexpenses = aexpenses;
        this.bexpenses = bexpenses;
        this.cause = cause;
        this.expensestime = expensestime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCause() {
        return cause;
    }

    public void setCause(String cause) {
        this.cause = cause;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAbed() {
        return abed;
    }

    public void setAbed(int abed) {
        this.abed = abed;
    }

    public int getBbed() {
        return bbed;
    }

    public void setBbed(int bbed) {
        this.bbed = bbed;
    }

    public Date getBedtime() {
        return bedtime;
    }

    public void setBedtime(Date bedtime) {
        this.bedtime = bedtime;
    }

    public int getAexpenses() {
        return aexpenses;
    }

    public void setAexpenses(int aexpenses) {
        this.aexpenses = aexpenses;
    }

    public int getBexpenses() {
        return bexpenses;
    }

    public void setBexpenses(int bexpenses) {
        this.bexpenses = bexpenses;
    }

    public Date getExpensestime() {
        return expensestime;
    }

    public void setExpensestime(Date expensestime) {
        this.expensestime = expensestime;
    }
}
