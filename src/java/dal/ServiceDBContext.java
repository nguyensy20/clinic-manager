/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Service;

/**
 *
 * @author vkhoa
 */
public class ServiceDBContext extends DBContext<Service> {

    @Override
    public void insert(Service model) {
        try {
            String sql = "INSERT INTO `swp391_project`.`service`\n"
                    + "(`name`,\n"
                    + "`description`)\n"
                    + "VALUES\n"
                    + "(?,\n"
                    + "?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getName());
            stm.setString(2, model.getDescription());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void update(Service model) {
        try {
            String sql = "UPDATE `swp391_project`.`service`\n"
                    + "SET\n"
                    + "`name` = ?,\n"
                    + "`description` = ?\n"
                    + "WHERE `id` = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getName());
            stm.setString(2, model.getDescription());
            stm.setInt(3, model.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void delete(Service model) {
        try {
            String sql = "DELETE FROM `swp391_project`.`service`\n"
                    + "WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Service get(int id) {
        try {
            Service service = new Service();
            String sql = "SELECT * FROM swp391_project.service where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                service.setName(rs.getString("name"));
                service.setDescription(rs.getString("description"));
            }
            return service;
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<Service> list() {
        try {
            ArrayList<Service> services = new ArrayList<>();
            String sql = "SELECT * FROM swp391_project.service";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Service service = new Service();
                service.setId(rs.getInt("id"));
                service.setName(rs.getString("name"));
                service.setDescription(rs.getString("description"));
                services.add(service);
            }
            return services;
        } catch (SQLException ex) {
            Logger.getLogger(TreatmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
