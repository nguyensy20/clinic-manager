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
public class Treatment {
    private int id;
    private String name;
    private String detail;
    private ArrayList<MedicalReport> medicalReports = new ArrayList<>();
    private int price;

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
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

    public ArrayList<MedicalReport> getMedicalReports() {
        return medicalReports;
    }

    public void setMedicalReports(ArrayList<MedicalReport> medicalReports) {
        this.medicalReports = medicalReports;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    @Override
    public String toString() {
        return "Treatment{" + "id=" + id + ", name=" + name + ", detail=" + detail + ", medicalReports=" + medicalReports + ", price=" + price + '}';
    }

 
}
