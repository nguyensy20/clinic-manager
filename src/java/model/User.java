/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author nguye
 */
public class User {

    private int id;
    private String name;
    private String address;
    private String avatarUrl;
    private Date dob;
    private String phone;
    private boolean gender;
    private String username;
    private String passwordHash;
    private boolean active;
    private int room;
    private String description;
    private ArrayList<Role> roles = new ArrayList<>();
    private ArrayList<Chat> chats = new ArrayList<>();
    private ArrayList<Booking> books = new ArrayList<>();
    private ArrayList<MedicalReport> medicalReports = new ArrayList<>();

    public ArrayList<Chat> getChats() {
        return chats;
    }

    public String getDescription() {
        return description;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setChats(ArrayList<Chat> chats) {
        this.chats = chats;
    }

    public ArrayList<Booking> getBooks() {
        return books;
    }

    public void setBooks(ArrayList<Booking> books) {
        this.books = books;
    }

    public ArrayList<MedicalReport> getMedicalReports() {
        return medicalReports;
    }

    public void setMedicalReports(ArrayList<MedicalReport> medicalReports) {
        this.medicalReports = medicalReports;
    }

    public ArrayList<Role> getRoles() {
        return roles;
    }

    public void setRoles(ArrayList<Role> roles) {
        this.roles = roles;
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

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public int getRoom() {
        return room;
    }

    public void setRoom(int room) {
        this.room = room;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", name=" + name + ", address=" + address + ", avatarUrl=" + avatarUrl + ", dob=" + dob + ", phone=" + phone + ", gender=" + gender + ", username=" + username + ", passwordHash=" + passwordHash + ", active=" + active + ", room=" + room + ", description=" + description + ", roles=" + roles + ", chats=" + chats + ", books=" + books + ", medicalReports=" + medicalReports + '}';
    }

    public boolean hasRoleId(int role_id) {
        ArrayList<Role> roles = this.getRoles();
        for (Role role : roles) {
            if (role.getId() == role_id) {
                return true;
            }
        }
        return false;
    }
}
