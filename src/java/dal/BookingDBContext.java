/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import com.mysql.cj.protocol.Resultset;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Booking;
import model.User;
import util.DateTimeHelper;

/**
 *
 * @author nguye
 */
public class BookingDBContext extends DBContext<Booking> {

    @Override
    public void insert(Booking model) {
        try {
            String sql = "insert into booking(bookingTime, reason, createdTime, patient_id)\n"
                    + "values (?, ?, ?, ?); ";
            PreparedStatement stm = connection.prepareStatement(sql);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.nnn", Locale.US);
            LocalDateTime createdTime = LocalDateTime.parse(model.getCreated_time().toString(), formatter);
            String createdTimeString = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(createdTime);

            stm.setString(1, model.getBooking_time().toString());
            stm.setString(2, model.getReason());
            stm.setString(3, createdTimeString);
            stm.setInt(4, model.getPatient().getId());
            stm.executeUpdate();
            System.out.println("Insert booking!");
        } catch (SQLException ex) {
            System.out.println("Can not insert booking");
        }
    }

    @Override
    public void update(Booking model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void delete(int patient_id, String bookingTime) {
        try {
            String sql = "delete from booking where \n"
                    + "bookingTime = ? and patient_id = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, bookingTime);
            stm.setInt(2,patient_id);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Can not delete booking");
        }
    }

    @Override
    public Booking get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

//    public ArrayList<Booking> findBookedPatientByName(String patient_name) {
//        ArrayList<Booking> bookings = new ArrayList<>();
//        try {
//            String sql = "select * from ((SELECT u.name, u.id as patient_id,u.phone,b.bookingTime, b.createdTime ,b.reason,b.status FROM user u\n"
//                    + "left join booking b on u.id = b.patient_id where u.id in \n"
//                    + "(select patient_id from booking) and  bookingTime >= curdate()\n"
//                    + "order by bookingTime) \n"
//                    + "union\n"
//                    + "(select distinct u.name,u.id as patient_id ,u.phone,b.bookingTime, b.createdTime,b.reason,b.status FROM user u\n"
//                    + "left join booking b on u.id = b.patient_id where u.id not in \n"
//                    + "(select patient_id from booking)) ) as a where a.name like ?";
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setString(1, "%" + patient_name + "%");
//            ResultSet rs = stm.executeQuery();
//            while (rs.next()) {
//                Booking b = new Booking();
//                if (rs.getString("bookingTime") != null) {
//                    b.setBooking_time(DateTimeHelper.toLocalDate(rs.getString("bookingTime")));
//                }
//                if (rs.getString("createdTime") != null) {
//                    b.setCreated_time(DateTimeHelper.toLocalDateTime(rs.getString("createdTime")));
//                }
//                b.setPatient_id(rs.getInt("patient_id"));
//                b.setReason(rs.getString("reason"));
//                b.setStatus(rs.getBoolean("status"));
//                bookings.add(b);
//            }
//            return bookings;
//        } catch (SQLException e) {
//        }
//        return null;
//    }

//    public ArrayList<Booking> getByPatientName(String patient_name) {
//        ArrayList<Booking> bookings = new ArrayList<>();
//        try {
//            String sql = "select b.patient_id as patient_id, b.bookingTime , b.createdTime, b.reason, b.status,\n"
//                    + "u.name from user u\n"
//                    + "join booking b on u.id = b.patient_id\n"
//                    + "where u.name like ?";
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setString(1, "%" + patient_name + "%");
//            ResultSet rs = stm.executeQuery();
//            while (rs.next()) {
//                Booking b = new Booking();
//                b.setBooking_time(DateTimeHelper.toLocalDate(rs.getString("bookingTime")));
//                b.setCreated_time(DateTimeHelper.toLocalDateTime(rs.getString("createdTime")));
//                b.setPatient_id(rs.getInt("patient_id"));
//                b.setReason(rs.getString("reason"));
//                b.setStatus(rs.getBoolean("status"));
//                bookings.add(b);
//            }
//            return bookings;
//        } catch (SQLException e) {
//        }
//        return null;
//    }

    public ArrayList<Booking> getByPatientId(int patient_id) {
        ArrayList<Booking> bookings = new ArrayList<>();
        try {
            String sql = "select * from booking\n"
                    + "where patient_id = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, patient_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Booking b = new Booking();
                b.setBooking_time(DateTimeHelper.toLocalDate(rs.getString("bookingTime")));
                b.setCreated_time(DateTimeHelper.toLocalDateTime(rs.getString("createdTime")));
                User u = new User();
                u.setId(patient_id);
                b.setPatient(u);
                b.setReason(rs.getString("reason"));
                b.setStatus(rs.getBoolean("status"));
                bookings.add(b);
            }
            return bookings;
        } catch (SQLException e) {
        }
        return null;
    }

    @Override
    public ArrayList<Booking> list() {
        ArrayList<Booking> bookings = new ArrayList<>();
        try {
            String sql = "select * from booking b\n"
                    + "join user u on b.patient_id = u.id";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Booking b = new Booking();
                b.setBooking_time(DateTimeHelper.toLocalDate(rs.getString("bookingTime")));
                b.setCreated_time(DateTimeHelper.toLocalDateTime(rs.getString("createdTime")));
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setAddress(rs.getString("address"));
                u.setName(rs.getString("name"));
                u.setPhone(rs.getString("phone"));
                u.setAvatarUrl(rs.getString("avatarUrl"));
                u.setDescription(rs.getString("description"));
                b.setPatient(u);
                b.setReason(rs.getString("reason"));
                b.setStatus(rs.getBoolean("status"));
                bookings.add(b);
            }
            return bookings;
        } catch (SQLException e) {
            System.out.println("Can not get booking list");
        }
        return null;
    }

    @Override
    public void delete(Booking model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
