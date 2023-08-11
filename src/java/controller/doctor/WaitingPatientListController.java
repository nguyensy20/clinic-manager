/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.doctor;

import controller.auth.BaseRoleController;
import dal.BookingDBContext;
import dal.UserDBContext;
import dal.WaitingPatientDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Enumeration;
import model.Booking;
import model.User;
import model.WaitingPatient;

/**
 *
 * @author nguye
 */
public class WaitingPatientListController extends BaseRoleController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        if (req.getParameter("name") != null) {
            String name = req.getParameter("name");
            UserDBContext udb = new UserDBContext();
            ArrayList<User> patients = udb.getPatientByName(name);
            System.out.println(patients);
            req.setAttribute("patients", patients);
            WaitingPatientDBContext wpdb = new WaitingPatientDBContext();
            ArrayList<WaitingPatient> waitingPatients = wpdb.getWaitingPatients();
            req.setAttribute("waitingPatients", waitingPatients);
            ArrayList<Integer> rooms = new ArrayList<>();
            rooms.add(1);
            rooms.add(2);
            rooms.add(3);
            req.setAttribute("rooms", rooms);
            req.getRequestDispatcher("/view/doctor/waiting-patient-list.jsp").forward(req, resp);
        }
        if (req.getParameter("edit") != null) {
            String name = req.getParameter("name");
            UserDBContext udb = new UserDBContext();
            ArrayList<User> patients = udb.findUserBooking(name);
            req.setAttribute("patients", patients);

            WaitingPatientDBContext wpdb = new WaitingPatientDBContext();

            Enumeration<String> paramNames = req.getParameterNames();
            while (paramNames.hasMoreElements()) {
                String paramName = paramNames.nextElement();
                if (paramName.startsWith("patient-")) {
                    int x = Integer.parseInt(paramName.substring("patient-".length()));
                    wpdb.insertByPatientID(x, null, null);
                    wpdb.arrangeRoom();
                }
            }

            ArrayList<WaitingPatient> waitingPatients = wpdb.getWaitingPatients();
            req.setAttribute("waitingPatients", waitingPatients);
            ArrayList<Integer> rooms = new ArrayList<>();
            rooms.add(1);
            rooms.add(2);
            rooms.add(3);
            req.setAttribute("rooms", rooms);
            req.getRequestDispatcher("/view/doctor/waiting-patient-list.jsp").forward(req, resp);
        }
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        ArrayList<Integer> rooms = new ArrayList<>();
        rooms.add(1);
        rooms.add(2);
        rooms.add(3);
        req.setAttribute("rooms", rooms);
        WaitingPatientDBContext wpdb = new WaitingPatientDBContext();

        if (req.getParameter("action") != null) {
            if (req.getParameter("action").equals("delete")) {
                int patient_id = Integer.parseInt(req.getParameter("patient_id"));
                wpdb.deleteByPatientId(patient_id);
                wpdb.arrangeRoom();
            }
        }
        ArrayList<WaitingPatient> waitingPatients = wpdb.getWaitingPatients();
        req.setAttribute("waitingPatients", waitingPatients);

        req.getRequestDispatcher("/view/doctor/waiting-patient-list.jsp").forward(req, resp);
    }
}
