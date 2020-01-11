package entity;

//Finance.jsp里面插图1的实体类
public class Finance1 {
    private int year;
    private int month;
    private int cost;
    private int collect;


    public Finance1() {
    }

    public Finance1(int year, int month, int cost, int collect) {
        this.year = year;
        this.month = month;
        this.cost = cost;
        this.collect = collect;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public int getCollect() {
        return collect;
    }

    public void setCollect(int collect) {
        this.collect = collect;
    }
}
