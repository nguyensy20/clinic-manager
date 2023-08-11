/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.time.LocalDateTime;
import java.util.ArrayList;

/**
 *
 * @author nguye
 */
public class MedicalReport {
    private LocalDateTime time;
    private int patient_id;
    private int doctor_id;
    private int pulse;
    private int bloodPress;
    private int breathing;
    private int height;
    private int weight;
    private String symptom;
    private String result;
    private boolean paid;
    private ArrayList<Drug> drugs = new ArrayList<>();
    private ArrayList<Treatment> treatments = new ArrayList<>();

    public boolean isPaid() {
        return paid;
    }

    public void setPaid(boolean paid) {
        this.paid = paid;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }

    public int getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(int patient_id) {
        this.patient_id = patient_id;
    }

    public int getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(int doctor_id) {
        this.doctor_id = doctor_id;
    }

    public int getPulse() {
        return pulse;
    }

    public void setPulse(int pulse) {
        this.pulse = pulse;
    }

    public int getBloodPress() {
        return bloodPress;
    }

    public void setBloodPress(int bloodPress) {
        this.bloodPress = bloodPress;
    }

    public int getBreathing() {
        return breathing;
    }

    public void setBreathing(int breathing) {
        this.breathing = breathing;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public String getSymptom() {
        return symptom;
    }

    public void setSymptom(String symptom) {
        this.symptom = symptom;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public ArrayList<Drug> getDrugs() {
        return drugs;
    }

    public void setDrugs(ArrayList<Drug> drugs) {
        this.drugs = drugs;
    }

    public ArrayList<Treatment> getTreatments() {
        return treatments;
    }

    public void setTreatments(ArrayList<Treatment> treatments) {
        this.treatments = treatments;
    }

    @Override
    public String toString() {
        return "MedicalReport{" + "time=" + time + ", patient_id=" + patient_id + ", doctor_id=" + doctor_id + ", pulse=" + pulse + ", bloodPress=" + bloodPress + ", breathing=" + breathing + ", height=" + height + ", weight=" + weight + ", symptom=" + symptom + ", result=" + result + ", drugs=" + drugs + ", treatments=" + treatments + '}';
    }

}
