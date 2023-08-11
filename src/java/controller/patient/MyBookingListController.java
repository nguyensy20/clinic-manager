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
import java.util.ArrayList;
import model.Booking;
import model.User;
import util.DateTimeHelper;

/**
 *
 * @author nguye
 */
public class MyBookingListController extends BaseRoleController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        req.getRequestDispatcher("booked-list/booked-list.jsp").forward(req, resp);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        int user_id = user.getId();
        BookingDBContext bdb = new BookingDBContext();
        ArrayList<Booking> bookings = bdb.getByPatientId(user_id);
        req.setAttribute("bookings", bookings);

        req.getRequestDispatcher("booked-list/booked-list.jsp").forward(req, resp);
    }

//    public static void main(String[] args) {
//        BookingDBContext bdb = new BookingDBContext();
//        ArrayList<Booking> bookings = bdb.getByPatientId(1);
////        req.setAttribute("bookings", bookings);
//        System.out.println(1);
//        System.out.println(bookings);
//        System.out.println(DateTimeHelper.isHistory(bookings.get(2).getBookingTime()));
//    }
}
