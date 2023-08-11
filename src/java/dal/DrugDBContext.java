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
import model.Drug;

/**
 *
 * @author nguye
 */
public class DrugDBContext extends DBContext<Drug> {

    @Override
    public void insert(Drug model) {
        try {
            String sql = "INSERT INTO `swp391_project`.`drug`\n"
                    + "(`name`,\n"
                    + "`unit_price`,\n"
                    + "`price`,\n"
                    + "`quantity_in_stock`)\n"
                    + "VALUES\n"
                    + "(?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?);";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getName());
            stm.setString(2, model.getUnit_price());
            stm.setInt(3, model.getPrice());
            stm.setInt(4, model.getQuantity_in_stock());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void update(Drug model) {
        try {
            String sql = "UPDATE `swp391_project`.`drug`\n"
                    + "SET\n"
                    + "`name` = ?,\n"
                    + "`unit_price` = ?,\n"
                    + "`price` = ?,\n"
                    + "`quantity_in_stock` = ?\n"
                    + "WHERE `id` = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getName());
            stm.setString(2, model.getUnit_price());
            stm.setInt(3, model.getPrice());
            stm.setInt(4, model.getQuantity_in_stock());
            stm.setInt(5, model.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateQuantity(int drug_id, int quantity) {
        try {
            String sql = "UPDATE `swp391_project`.`drug`"
                    + " SET `quantity_in_stock` = ?"
                    + " WHERE (`id` = ?);";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, quantity);
            stm.setInt(2, drug_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void delete(Drug model) {
        try {
            String sql = "DELETE FROM `swp391_project`.`drug`\n"
                    + "WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Drug get(int id) {
        try {
            Drug drug = new Drug();
            String sql = "SELECT * FROM swp391_project.drug where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                drug.setName(rs.getString("name"));
                drug.setPrice(rs.getInt("price"));
                drug.setUnit_price(rs.getString("unit_price"));
                drug.setQuantity_in_stock(rs.getInt("quantity_in_stock"));
            }
            return drug;
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<Drug> list() {
        try {
            ArrayList<Drug> drugs = new ArrayList<>();
            String sql = "SELECT * FROM swp391_project.drug";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Drug drug = new Drug();
                drug.setId(rs.getInt("id"));
                drug.setName(rs.getString("name"));
                drug.setUnit_price(rs.getString("unit_price"));
                drug.setPrice(rs.getInt("price"));
                drug.setQuantity_in_stock(rs.getInt("quantity_in_stock"));

                drugs.add(drug);
            }
            return drugs;
        } catch (SQLException ex) {
            Logger.getLogger(TreatmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Drug> getListDrugByName(String txtName) {
        try {
            ArrayList<Drug> drugs = new ArrayList<>();
            String sql = "SELECT `drug`.`id`,\n"
                    + "    `drug`.`name`,\n"
                    + "    `drug`.`unit_price`,\n"
                    + "    `drug`.`price`,\n"
                    + "    `drug`.`quantity_in_stock`\n"
                    + "FROM `swp391_project`.`drug` \n"
                    + "WHERE name like ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + txtName + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Drug drug = new Drug();
                drug.setId(rs.getInt("id"));
                drug.setName(rs.getString("name"));
                drug.setPrice(rs.getInt("price"));
                drug.setQuantity_in_stock(rs.getInt("quantity_in_stock"));
                drug.setUnit_price(rs.getString("unit_price"));
                drugs.add(drug);
            }
            return drugs;
        } catch (SQLException ex) {
            Logger.getLogger(DrugDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Drug> pagingDrug(int pageNumber, int pageSize) {
        try {
            ArrayList<Drug> drugs = new ArrayList<>();
            String sql = "SELECT * FROM swp391_project.drug ORDER BY id LIMIT ? OFFSET ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            int offset = (pageNumber - 1) * pageSize;
            stm.setInt(1, pageSize);
            stm.setInt(2, offset);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Drug drug = new Drug();
                drug.setId(rs.getInt("id"));
                drug.setName(rs.getString("name"));
                drug.setUnit_price(rs.getString("unit_price"));
                drug.setPrice(rs.getInt("price"));
                drug.setQuantity_in_stock(rs.getInt("quantity_in_stock"));

                drugs.add(drug);
            }
            return drugs;
        } catch (SQLException ex) {
            Logger.getLogger(DrugDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int getTotalItems() {
        int totalItems = 0;
        try {
            String sql = "SELECT COUNT(*) as count FROM swp391_project.drug";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                totalItems = rs.getInt("count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalItems;
    }

}
