/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.patient;

import controller.auth.BaseRoleController;
import dal.BookingDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import model.Booking;
import model.Role;
import model.User;
import util.DateTimeHelper;

/**
 *
 * @author nguye
 */
public class RemoveBookingController extends BaseRoleController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        processRequest(req, resp, user);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        processRequest(req, resp, user);
    }

    public void processRequest(HttpServletRequest req, HttpServletResponse resp, User user) throws IOException, ServletException {
        int user_id = user.getId();
        LocalDate booking_time = DateTimeHelper.toLocalDate(req.getParameter("booking_time"));
        BookingDBContext bdb = new BookingDBContext();

        Booking booking = new Booking();
        booking.setBooking_time(booking_time);
        User u = new User();
        u.setId(user_id);
        booking.setPatient(u);

        bdb.delete(booking);
        resp.sendRedirect("patient/booked-list");
    }

}
