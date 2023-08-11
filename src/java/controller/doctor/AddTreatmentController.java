/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.doctor;

import controller.auth.BaseRoleController;
import dal.DrugDBContext;
import dal.MedicalReportDBContext;
import dal.TreatmentDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Drug;
import model.Treatment;
import model.User;

/**
 *
 * @author nguye
 */
public class AddTreatmentController extends BaseRoleController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        User patient = ((User) req.getSession().getAttribute("patient"));
        int doctor_id = ((User) req.getSession().getAttribute("patient")).getId();
        String timeString = (String) req.getSession().getAttribute("time");

        
        
        if (req.getParameter("add") != null) {
            resp.sendRedirect("add-treatment-detail");
        }
        if (req.getParameter("save") != null) {
            resp.sendRedirect("edit-examination?patient_id="+patient.getId());
        }
//        req.getRequestDispatcher("add-treatment/add-treatment.jsp").forward(req, resp);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        MedicalReportDBContext mddb = new MedicalReportDBContext();
        User patient = ((User) req.getSession().getAttribute("patient"));
        int doctor_id = ((User) req.getSession().getAttribute("user")).getId();
        String timeString = (String) req.getSession().getAttribute("time");

        if (req.getParameter("action")!=null){
            int treatment_id = Integer.parseInt(req.getParameter("treatment_id"));
            mddb.deleteTreatment(patient.getId(), doctor_id, timeString, treatment_id);
        }
//        System.out.println(patient.getId()+""+doctor_id+""+timeString);
        String symptom = req.getParameter("symptom");
        req.setAttribute("symptom", symptom);

        ArrayList<Treatment> treatments = mddb.getListTreatment(patient.getId(), doctor_id, timeString);
        req.setAttribute("treatments", treatments);
        
        System.out.println(treatments);

        req.getRequestDispatcher("../view/doctor/add-treatment.jsp").forward(req, resp);
    }

}
