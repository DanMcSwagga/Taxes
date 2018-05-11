package ua.kpi.tef.model.entity;

import java.io.Serializable;

public class IncomeType implements Serializable{

    private int typeID;
    private double taxRate;
    private String name;

    public IncomeType(int typeID, double taxRate, String name) {
        this.typeID = typeID;
        this.taxRate = taxRate;
        this.name = name;
    }

    public int getTypeID() {
        return typeID;
    }

    public void setTypeID(int typeID) {
        this.typeID = typeID;
    }

    public double getTaxRate() {
        return taxRate;
    }

    public void setTaxRate(double taxRate) {
        this.taxRate = taxRate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "IncomeType{" +
                "typeID=" + typeID +
                ", taxRate=" + taxRate +
                ", name='" + name + '\'' +
                '}';
    }
}
