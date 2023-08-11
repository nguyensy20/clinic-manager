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
import model.Diseae;

/**
 *
 * @author nguye
 */
public class DiseaseDBContext extends DBContext<Diseae>{

    @Override
    public void insert(Diseae model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Diseae model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Diseae model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Diseae get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Diseae> list() {
        try {
            ArrayList<Diseae> diseaes = new ArrayList<>();
            String sql = "SELECT * FROM swp391_project.disease";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Diseae diseae =  new Diseae();
                diseae.setId(rs.getInt("id"));
                diseae.setName(rs.getString("name"));
                diseae.setDescription(rs.getString("description"));
                diseaes.add(diseae);
            }
            return diseaes;
        } catch (SQLException ex) {
            Logger.getLogger(DiseaseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
   
}
