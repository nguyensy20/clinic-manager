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
import model.Treatment;

/**
 *
 * @author nguye
 */
public class TreatmentDBContext extends DBContext<Treatment> {

    @Override
    public void insert(Treatment model) {
        try {
            String sql = "INSERT INTO `swp391_project`.`treatment`\n"
                    + "(`name`,\n"
                    + "`price`)\n"
                    + "VALUES\n"
                    + "(?,\n"
                    + "?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getName());
            stm.setInt(2, model.getPrice());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void update(Treatment model) {
        try {
            String sql = "UPDATE `swp391_project`.`treatment`\n"
                    + "SET\n"
                    + "`name` = ?,\n"
                    + "`price` = ?\n"
                    + "WHERE `id` = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getName());
            stm.setInt(2, model.getPrice());
            stm.setInt(3, model.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void delete(Treatment model) {
        try {
            String sql = "DELETE FROM `swp391_project`.`treatment`\n"
                    + "WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Treatment get(int id) {
        try {
            Treatment treatment = new Treatment();
            String sql = "SELECT * FROM swp391_project.treatment where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                treatment.setName(rs.getString("name"));
                treatment.setPrice(rs.getInt("price"));
            }
            return treatment;
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<Treatment> list() {
        try {
            ArrayList<Treatment> treatments = new ArrayList<>();
            String sql = "SELECT * FROM swp391_project.treatment";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Treatment treatment = new Treatment();
                treatment.setId(rs.getInt("id"));
                treatment.setName(rs.getString("name"));
                treatment.setPrice(rs.getInt("price"));
                
                treatments.add(treatment);
            }
            return treatments;
        } catch (SQLException ex) {
            Logger.getLogger(TreatmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
