/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.doctor;

import controller.auth.BaseRoleController;
import dal.DrugDBContext;
import dal.MedicalReportDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Drug;
import model.User;

/**
 *
 * @author nguye
 */
public class AddDrugDetailController extends BaseRoleController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        MedicalReportDBContext mddb = new MedicalReportDBContext();
        int patient_id = ((User) req.getSession().getAttribute("patient")).getId();
        int doctor_id = ((User) req.getSession().getAttribute("user")).getId();
        String timeString = (String) req.getSession().getAttribute("time");
        System.out.println(req.getParameter("amount"));
        int amount = Integer.parseInt(req.getParameter("amount"));
        String dosage = req.getParameter("dosage");
        int drug_id = Integer.parseInt(req.getParameter("drug"));

        DrugDBContext ddb = new DrugDBContext();
        Drug drug = ddb.get(drug_id);
        int price = drug.getPrice();

        //If aciton = add => insert new Drug, action = edit => update exist drug
        if (req.getParameter("action").equals("add")) {
            ddb.updateQuantity(drug_id, drug.getQuantity_in_stock() - amount);
            mddb.insertDrug(patient_id, doctor_id, timeString, drug_id, amount, price, dosage);
        } else if (req.getParameter("action").equals("edit")) {

        }

        resp.sendRedirect("add-drug?action=view");
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        DrugDBContext ddb = new DrugDBContext();
        ArrayList<Drug> drugs = ddb.list();
        req.setAttribute("drugs", drugs);
        req.setAttribute("action", req.getParameter("action"));
        MedicalReportDBContext mddb = new MedicalReportDBContext();

        //Get drug information 
        
        if (req.getParameter("action").equals("add")) {
            req.getRequestDispatcher("../view/doctor/add-drug-detail.jsp").forward(req, resp);
        } else if (req.getParameter("action").equals("edit")) {
            int patient_id = ((User) req.getSession().getAttribute("patient")).getId();
            int doctor_id = ((User) req.getSession().getAttribute("user")).getId();
            String timeString = (String) req.getSession().getAttribute("time");
            int drug_id = Integer.parseInt(req.getParameter("drug_id"));
            Drug drug = mddb.getDrug(patient_id, doctor_id, timeString, drug_id);
            req.setAttribute("reportDrug", drug);
            
            req.getRequestDispatcher("../view/doctor/add-drug-detail.jsp").forward(req, resp);
        }
    }

}
