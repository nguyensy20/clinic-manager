/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.doctor;

import controller.auth.BaseRoleController;
import dal.MedicalReportDBContext;
import dal.TreatmentDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Treatment;
import model.User;

/**
 *
 * @author nguye
 */
public class AddTreatmentDetailController extends BaseRoleController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        if (req.getParameter("back") != null) {
            System.out.println("back != null");
            resp.sendRedirect("add-treatment");
        } else {
            System.out.println("back == null");
            int treatment_id = Integer.parseInt(req.getParameter("treatment"));
            TreatmentDBContext tmdb = new TreatmentDBContext();
            Treatment treatment = tmdb.get(treatment_id);
//            float price = treatment.getPrice();
            String detail = req.getParameter("detail");
            int price = treatment.getPrice();
            int patient_id = ((User) req.getSession().getAttribute("patient")).getId();
            int doctor_id = ((User) req.getSession().getAttribute("user")).getId();
            String timeString = (String) req.getSession().getAttribute("time");
            MedicalReportDBContext mddb = new MedicalReportDBContext();
            if (req.getParameter("action").equals("edit")) {
                mddb.updateTreatment(detail, patient_id, doctor_id, timeString, treatment_id);
            } else {
                mddb.insertTreatment(patient_id, doctor_id, timeString, treatment_id, detail, price);
            }
//        req.getRequestDispatcher("add-treatment-detail/add-treatment-detail.jsp").forward(req, resp);
            resp.sendRedirect("add-treatment");
        }
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        TreatmentDBContext trdb = new TreatmentDBContext();
        ArrayList<Treatment> treatments = trdb.list();
        req.setAttribute("treatments", treatments);

        if (req.getParameter("action") != null) {
            int treatment_id = Integer.parseInt(req.getParameter("treatment_id"));
            User patient = (User) req.getSession().getAttribute("patient");
            int patient_id = patient.getId();
            User doctor = (User) req.getSession().getAttribute("user");
            int doctor_id = doctor.getId();
            String timeString = (String) req.getSession().getAttribute("time");
            MedicalReportDBContext mddb = new MedicalReportDBContext();
            Treatment treatment = mddb.getTreatment(patient_id, doctor_id, timeString, treatment_id);
            req.setAttribute("treatment", treatment);
            req.setAttribute("action", req.getParameter("action"));
        }
        req.getRequestDispatcher("../view/doctor/add-treatment-detail.jsp").forward(req, resp);
    }

}
