/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author nguye
 */
public class WaitingPatient {
    private int patient_id;
    private String reason;
    private int room;
    private LocalDateTime arrival_time;
    private LocalDateTime book_created_time;

    public LocalDateTime getArrival_time() {
        return arrival_time;
    }

    public void setArrival_time(LocalDateTime arrival_time) {
        this.arrival_time = arrival_time;
    }

    public LocalDateTime getBook_created_time() {
        return book_created_time;
    }

    public void setBook_created_time(LocalDateTime book_created_time) {
        this.book_created_time = book_created_time;
    }

    public int getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(int patient_id) {
        this.patient_id = patient_id;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public int getRoom() {
        return room;
    }

    public void setRoom(int room) {
        this.room = room;
    }

    @Override
    public String toString() {
        return "WaitingPatient{" + "patient_id=" + patient_id + ", reason=" + reason + ", room=" + room + ", arrival_time=" + arrival_time + ", book_created_time=" + book_created_time + '}' +"\n";
    }

}
