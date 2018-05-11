package ua.kpi.tef.model.entity;

public class Income {

    private int id;
    private int month;
    private double amount;
    private String taxPayer;
    private IncomeType incomeType;

    public Income(int id, int month, double amount, String taxPayer, IncomeType incomeType) {
        this.id = id;
        this.month = month;
        this.amount = amount;
        this.taxPayer = taxPayer;
        this.incomeType = incomeType;
    }

    public double calculateTax() {
        return this.amount * this.incomeType.getTaxRate() / 100.0;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getTaxPayer() {
        return taxPayer;
    }

    public void setTaxPayer(String taxPayer) {
        this.taxPayer = taxPayer;
    }

    public IncomeType getIncomeType() {
        return incomeType;
    }

    public void setIncomeType(IncomeType incomeType) {
        this.incomeType = incomeType;
    }

    @Override
    public String toString() {
        return "Income{" +
                "id=" + id +
                ", month=" + month +
                ", amount=" + amount +
                ", taxPayer='" + taxPayer + '\'' +
                ", " + incomeType +
                '}';
    }
}
