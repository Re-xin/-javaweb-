package entity;

public class PatientCure {
    private String cause;
    private int expenses;

    public PatientCure() {
    }

    public PatientCure(String cause, int expenses) {
        this.cause = cause;
        this.expenses = expenses;
    }

    public String getCause() {
        return cause;
    }

    public void setCause(String cause) {
        this.cause = cause;
    }

    public int getExpenses() {
        return expenses;
    }

    public void setExpenses(int expenses) {
        this.expenses = expenses;
    }
}
