/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import model.WaitingPatient;
import util.DateTimeHelper;

/**
 *
 * @author nguye
 */
public class WaitingPatientDBContext extends DBContext<WaitingPatient> {

    @Override
    public void insert(WaitingPatient model) {
    }

    @Override
    public void update(WaitingPatient model) {
    }

    @Override
    public void delete(WaitingPatient model) {
    }

    public void deleteByPatientId(int patient_id) {
        try {
            String sql = "DELETE FROM waiting_patient where patient_id=?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, patient_id);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    @Override
    public WaitingPatient get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<WaitingPatient> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void insertByPatientID(int patient_id, String reason,
            String book_created_time) {
        try {
            String sql = "insert into waiting_patient (patient_id, reason, arrival_time, book_created_time)\n"
                    + "values (?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, patient_id);
            stm.setString(2, reason);
            stm.setString(3, DateTimeHelper.toDateTimeSql(LocalDateTime.now()));
            stm.setString(4, book_created_time);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Cannot insert");
        }
    }

    public void updateByPatientId(int patient_id, int room) {
        try {
            String sql = "update waiting_patient \n"
                    + "set room = ?\n"
                    + "where patient_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, room);
            stm.setInt(2, patient_id);
            stm.executeUpdate();
            System.out.println("UPDATE");
        } catch (SQLException e) {
            System.out.println("cannot update");
        }
    }

    public ArrayList<WaitingPatient> getWaitingPatients() {
        ArrayList<WaitingPatient> waitingPatients = new ArrayList<>();
        try {
            String sql = "select * from waiting_patient";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                WaitingPatient wp = new WaitingPatient();
                wp.setPatient_id(rs.getInt("patient_id"));
                wp.setReason(rs.getString("reason"));
                wp.setRoom(rs.getInt("room"));
                wp.setArrival_time(DateTimeHelper.toLocalDateTime(rs.getString("arrival_time")));
                wp.setBook_created_time(DateTimeHelper.toLocalDateTime(rs.getString("book_created_time")));
                waitingPatients.add(wp);
            }
            Collections.sort(waitingPatients, new PriorityComparator());
            return waitingPatients;
        } catch (SQLException e) {
        }
        return null;
    }

    public boolean isRoomAvailable(int room_id) {
        try {
            String sql = "select * from waiting_patient where room = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, room_id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Cannot check");
        }
        return true;
    }

    public void arrangeRoom() {
        ArrayList<WaitingPatient> waitingPatients = new ArrayList<>();
        try {
            String sql = "select * from waiting_patient where isnull(room)";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                WaitingPatient wp = new WaitingPatient();
                wp.setPatient_id(rs.getInt("patient_id"));
                wp.setReason(rs.getString("reason"));
                wp.setRoom(rs.getInt("room"));
                wp.setArrival_time(DateTimeHelper.toLocalDateTime(rs.getString("arrival_time")));
                wp.setBook_created_time(DateTimeHelper.toLocalDateTime(rs.getString("book_created_time")));
                waitingPatients.add(wp);
            }
            Collections.sort(waitingPatients, new PriorityComparator());
            System.out.println(waitingPatients);
            int j = 0;
            int lenNull = waitingPatients.size();
            for (int i = 0; i < 3; i++) {
                if (isRoomAvailable(i + 1)) {
                    if (j < lenNull) {
                        updateByPatientId(waitingPatients.get(j).getPatient_id(), i + 1);
                        j++;
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("Cannot arrange room");
        }
    }

    public boolean hasPatientId(int patient_id) {
        try {
            String sql = "select * from waiting_patient where patient_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, patient_id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("Cannot check");
        }
        return false;
    }
}
