/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author nguye
 */
public class Drug {
    private int id;
    private String name;
    private String unit_price;
    private int price;
    private int quantity_in_stock;
    private String dosage;
    private int amount;

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
    
    public String getDosage() {
        return dosage;
    }

    public void setDosage(String dosage) {
        this.dosage = dosage;
    }
    
    public int getQuantity_in_stock() {
        return quantity_in_stock;
    }

    public void setQuantity_in_stock(int quantity_in_stock) {
        this.quantity_in_stock = quantity_in_stock;
    }
    public String getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(String unit_price) {
        this.unit_price = unit_price;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    private ArrayList<MedicalReport> medicalReports = new ArrayList<>();

    public ArrayList<MedicalReport> getMedicalReports() {
        return medicalReports;
    }

    public void setMedicalReports(ArrayList<MedicalReport> medicalReports) {
        this.medicalReports = medicalReports;
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

    @Override
    public String toString() {
        return "Drug{" + "id=" + id + ", name=" + name + ", unit_price=" + unit_price + ", price=" + price + ", quantity_in_stock=" + quantity_in_stock + ", dosage=" + dosage + ", medicalReports=" + medicalReports +", amount=" +amount+'}';
    }

    
}
