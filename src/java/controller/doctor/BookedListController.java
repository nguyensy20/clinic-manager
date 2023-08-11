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
import java.util.ArrayList;
import model.Booking;
import model.User;

/**
 *
 * @author nguye
 */
public class BookedListController extends BaseRoleController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        processRequest(req, resp, user);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        processRequest(req, resp, user);
    }

    public void processRequest(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        BookingDBContext bdb = new BookingDBContext();
        WaitingPatientDBContext wpdb = new WaitingPatientDBContext();

        if (req.getParameter("action") != null) {
            if (req.getParameter("action").equals("move")) {
                int patient_id = Integer.parseInt(req.getParameter("patient_id"));
                String bookingTimeString = req.getParameter("booking_time");
                String createdTimeString = req.getParameter("book_created_time");
                String reason = req.getParameter("reason");

                if (!wpdb.hasPatientId(patient_id)) {
                    wpdb.insertByPatientID(patient_id, reason, createdTimeString);
                    wpdb.arrangeRoom();
                }
            }
            ArrayList<Booking> bookings = bdb.list();
            req.setAttribute("bookings", bookings);
            req.getRequestDispatcher("../view/doctor/view-booked-list.jsp").forward(req, resp);
        } else {
            ArrayList<Booking> bookings = bdb.list();
            req.setAttribute("bookings", bookings);
            req.getRequestDispatcher("../view/doctor/view-booked-list.jsp").forward(req, resp);
        }

    }
}
