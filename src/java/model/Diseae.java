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
public class Diseae {
    private int id;
    private String name;
    private String description;

   
    private ArrayList<MedicalReport> medicalReports = new ArrayList<>();

    
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
     public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    
}
