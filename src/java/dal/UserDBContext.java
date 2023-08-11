/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.io.IOException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Booking;
import model.Feature;
import model.Role;
import model.User;
import util.DateTimeHelper;

/**
 *
 * @author nguye
 */
public class UserDBContext extends DBContext<User> {

    @Override
    public void insert(User model) {
        try {
            String sql = "INSERT INTO user(id,name, address, dob, phone, gender, username, passwordHash)\n"
                    + "VALUES(?, ?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getId());
            stm.setString(2, model.getName());
            stm.setString(3, model.getAddress());
            stm.setDate(4, model.getDob());
            stm.setString(5, model.getPhone());
            stm.setBoolean(6, model.isGender());
            stm.setString(7, model.getUsername());
            stm.setString(8, model.getPasswordHash());
            stm.executeUpdate();
        } catch (SQLException ex) {
        }
    }

    @Override
    public void update(User model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(User model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<User> getByRole(int rid) throws IOException {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "select u.id, u.name, u.description, u.dob, u.phone, u.active, u.room,\n"
                    + "uhr.role_id from user u\n"
                    + "join user_has_role uhr on u.id = uhr.user_id\n"
                    + "where role_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, rid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setDescription(rs.getString("description"));
                user.setDob((Date.valueOf(rs.getString("dob"))));
                user.setPhone(rs.getString("phone"));
                user.setActive(rs.getBoolean("active"));

                users.add(user);

            }
            return users;
        } catch (SQLException e) {
        }
        return null;

    }

    public User get(String username, String passwordHash) throws IOException {
        try {
            String sql = "select u.id as uid,u.description , u.username,u.name, u.dob, u.phone, u.gender, u.active, u.room, u.address, \n"
                    + " u.dob, u.phone, u.gender, u.active, u.room, \n"
                    + "r.id as rid ,r.name as rname, \n"
                    + "f.id as fid, f.name as fname, f.url as url from user u\n"
                    + "join user_has_role uhr on u.id = uhr.user_id\n"
                    + "join role r on r.id = uhr.role_id\n"
                    + "join role_has_feature rhf on rhf.role_id = r.id\n"
                    + "join feature f on f.id = rhf.feature_id\n"
                    + "where u.username = ? and u.passwordHash = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, passwordHash);
            ResultSet rs = stm.executeQuery();
            User user = null;
            Role currentRole = new Role();
            currentRole.setId(-1);
            while (rs.next()) {
                if (user == null) {
                    user = new User();
                    user.setId(rs.getInt("uid"));
                    user.setUsername(rs.getString("username"));
                    user.setName(rs.getString("name"));
                    user.setDob(rs.getDate("dob"));
                    user.setPhone(rs.getString("phone"));
                    user.setGender(rs.getBoolean("gender"));
                    user.setActive(rs.getBoolean("active"));
                    user.setRoom(rs.getInt("room"));
                    user.setAddress(rs.getString("address"));
//                    String description = rs.getString("description");
                    user.setDescription(rs.getString("description"));
                }
                int rid = rs.getInt("rid");
                if (rid != 0) {
                    if (rid != currentRole.getId()) {
                        currentRole = new Role();
                        currentRole.setId(rs.getInt("rid"));
                        currentRole.setName(rs.getString("rname"));
                        user.getRoles().add(currentRole);
                    }
                }

                int fid = rs.getInt("fid");
                if (fid != 0) {
                    Feature f = new Feature();
                    f.setId(rs.getInt("fid"));
                    f.setName(rs.getString("fname"));
                    f.setUrl(rs.getString("url"));
                    currentRole.getFeatures().add(f);
                }
            }
            return user;
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<User> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public User get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public String getNameById(int user_id) {
        try {
            String sql = "select name from user where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, user_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                return name;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public User getById(int user_id) {
        try {
            String sql = "select * from user where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, user_id);
            ResultSet rs = stm.executeQuery();
            User user = new User();
            while (rs.next()) {
                user.setId(user_id);
                user.setName(rs.getString("name"));
                user.setAddress(rs.getString("address"));
                user.setDescription(rs.getString("description"));
                user.setAvatarUrl(rs.getString("avatarUrl"));
                user.setDob(rs.getDate("dob"));
                user.setPhone(rs.getString("phone"));
                user.setGender(rs.getBoolean("gender"));
                user.setUsername(rs.getString("username"));
                user.setActive(rs.getBoolean("active"));
                user.setRoom(rs.getInt("room"));
            }

            return user;
        } catch (SQLException e) {
        }
        return null;

    }

    public ArrayList<User> findUserBooking(String name) {
        ArrayList<User> users = new ArrayList<>();
        try {
//            String sql = "select * from (select u.id, u.name, u.avatarUrl, u.description, u.dob, u.phone, u.gender, u.username, u.active,\n"
//                    + "b.bookingTime, b.reason, b.createdTime, b.doctor_id, b.status from user u \n"
//                    + "left join booking b on u.id = b.patient_id where u.id in \n"
//                    + "(select patient_id from booking) and bookingTime >=curdate()\n"
//                    + "union \n"
//                    + "select u.id, u.name, u.avatarUrl, u.description, u.dob, u.phone, u.gender, u.username, u.active,\n"
//                    + "b.bookingTime, b.reason, b.createdTime, b.doctor_id, b.status from user u \n"
//                    + "left join booking b on u.id = b.patient_id where u.id not in \n"
//                    + "(select patient_id from booking) )as a where a.name like ?";
            String sql = "select * from (select u.id, u.name,u.address, u.avatarUrl, u.description, u.dob, u.phone, u.gender, u.username, u.active, \n"
                    + "b.bookingTime, b.reason, b.createdTime,  b.status from user u \n"
                    + "left join booking b on u.id = b.patient_id where u.id in\n"
                    + "(select patient_id from booking) and bookingTime >=curdate()\n"
                    + "union\n"
                    + "select u.id, u.name,u.address, u.avatarUrl, u.description, u.dob, u.phone, u.gender, u.username, u.active,\n"
                    + "b.bookingTime, b.reason, b.createdTime,  b.status from user u \n"
                    + "left join booking b on u.id = b.patient_id where u.id not in\n"
                    + "(select patient_id from booking) )as a where a.name like ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + name + "%");
            ResultSet rs = stm.executeQuery();
            User curUser = new User();
            curUser.setId(-1);
            while (rs.next()) {
                if (rs.getInt("id") != curUser.getId()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setAvatarUrl(rs.getString("avatarUrl"));
                    user.setName(rs.getString("name"));
                    user.setDescription(rs.getString("description"));
                    user.setDob(rs.getDate("dob"));
                    user.setPhone(rs.getString("phone"));
                    user.setGender(rs.getBoolean("gender"));
                    user.setActive(rs.getBoolean("active"));
                    user.setAddress(rs.getString("address"));

                    Booking b = new Booking();
                    if (rs.getString("bookingTime") != null) {
                        b.setBooking_time(DateTimeHelper.toLocalDate(rs.getString("bookingTime")));
                        System.out.println("ok");
                    }
                    if (rs.getString("createdTime") != null) {
                        b.setCreated_time(DateTimeHelper.toLocalDateTime(rs.getString("createdTime")));
                    }
                    b.setReason(rs.getString("reason"));
                    b.setStatus(rs.getBoolean("status"));

                    user.getBooks().add(b);
                    curUser.setId(user.getId());
//                    System.out.println("ok");
                    users.add(user);
                }
            }
            return users;
        } catch (SQLException e) {
        }
        return null;
    }

    public static void main(String[] args) throws IOException {
        UserDBContext udb = new UserDBContext();
//        ArrayList<User> user = udb.getByRole(2);
//        User user = udb.get("mrf", "mrf");
//        User user = udb.getById(7);
        ArrayList<User> users = udb.findUserBooking("");
//        String name = udb.getNameById(3);?
        System.out.println(users);
    }

    public void updateDescription(String description, int id) {
        try {
            String sql = "UPDATE `swp391_project`.`user` "
                    + "SET `description` = ?"
                    + " WHERE (`id` = ?);";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, description);
            stm.setInt(2, id);
            stm.executeUpdate();
            System.out.println("Update description");
        } catch (SQLException ex) {
            System.out.println("Can not Update description");
        }
    }

    public ArrayList<User> getPatientByName(String name) {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "select u.id, u.name, u.address, u.avatarUrl, u.description, u.dob, u.phone, u.gender from user u \n"
                    + "join user_has_role uhr on u.id = uhr.user_id\n"
                    + "where uhr.role_id = 1 and u.name like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + name + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setDescription(rs.getString("description"));
                user.setDob((Date.valueOf(rs.getString("dob"))));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                users.add(user);
                
            }
            return users;
        } catch (SQLException e) {
        }
        return null;
    }
}
