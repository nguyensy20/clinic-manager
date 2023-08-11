/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.patient;

import controller.auth.BaseRoleController;
import dal.BookingDBContext;
import dal.UserDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import model.Booking;
import model.User;
import util.DateTimeHelper;

/**
 *
 * @author nguye
 */
public class BookingController extends BaseRoleController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        int patient_id = Integer.parseInt(req.getParameter("patient_id"));
        LocalDate booking_time = DateTimeHelper.toLocalDate(req.getParameter("booking-time"));
        String reason = req.getParameter("reason");

        UserDBContext udb = new UserDBContext();
        ArrayList<User> doctors = udb.getByRole(2);
        req.setAttribute("doctors", doctors);

        Booking booking = new Booking();
        booking.setBooking_time(booking_time);
        booking.setCreated_time(LocalDateTime.now());
        User u  = new User();
        u.setId(patient_id);
        booking.setPatient(u);
        booking.setReason(reason);

        BookingDBContext bdb = new BookingDBContext();
        bdb.insert(booking);

//        req.getRequestDispatcher("booking/booking.jsp").forward(req, resp);
        resp.sendRedirect("booked-list");

    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
//        int uid = Integer.parseInt(req.getParameter("uid"));
        UserDBContext udb = new UserDBContext();
        ArrayList<User> doctors = udb.getByRole(2);
        req.setAttribute("doctors", doctors);

        req.getRequestDispatcher("booking/booking.jsp").forward(req, resp);
    }
}
