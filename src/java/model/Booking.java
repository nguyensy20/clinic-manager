/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.time.LocalDate;
import java.time.LocalDateTime;
/**
 *
 * @author nguye
 */
public class Booking {
    private User patient;
    private String reason;
    private boolean status;
    private LocalDateTime created_time;
    private LocalDate booking_time;

    public Booking() {
    }

    public User getPatient() {
        return patient;
    }

    public void setPatient(User patient) {
        this.patient = patient;
    }
    

 

    public Booking(User patient, String reason, LocalDateTime createdTime, LocalDate bookingTime) {
        this.patient = patient;
        this.reason = reason;
        this.created_time = createdTime;
        this.booking_time = bookingTime;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public LocalDateTime getCreated_time() {
        return created_time;
    }

    public void setCreated_time(LocalDateTime created_time) {
        this.created_time = created_time;
    }

    public LocalDate getBooking_time() {
        return booking_time;
    }

    public void setBooking_time(LocalDate booking_time) {
        this.booking_time = booking_time;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Booking{" + "patient" + patient + ", reason=" + reason + ", status=" + status + ", createdTime=" + created_time + ", bookingTime=" + booking_time + '}';
    }
}
