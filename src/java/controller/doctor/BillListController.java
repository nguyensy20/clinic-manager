/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.doctor;

import controller.auth.BaseRoleController;
import dal.MedicalReportDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.MedicalReport;
import model.User;

/**
 *
 * @author nguye
 */
public class BillListController extends BaseRoleController{

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        processRequest(req, resp, user);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        processRequest(req, resp, user);
    }
    
    public void processRequest(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        MedicalReportDBContext mddb = new MedicalReportDBContext();
        ArrayList<MedicalReport> medicalReports = mddb.getNotPaidList();
        req.setAttribute("medicalReports", medicalReports);
        req.getRequestDispatcher("../view/doctor/bill-list.jsp").forward(req, resp);
    }
}
