/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.doctor;

import controller.auth.BaseRoleController;
import dal.MedicalReportDBContext;
import dal.UserDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.MedicalReport;
import model.User;

/**
 *
 * @author nguye
 */
public class CreateBillController extends BaseRoleController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        if (req.getParameter("is_paid") != null) {
            MedicalReportDBContext mddb = new MedicalReportDBContext();
            int patient_id = Integer.parseInt(req.getParameter("patient_id"));
            int doctor_id = Integer.parseInt(req.getParameter("doctor_id"));
            String timeString = (String) req.getParameter("time");
            mddb.updateIsPaid(patient_id, doctor_id, timeString, 1);
        }
        resp.sendRedirect("bill-list");
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        MedicalReportDBContext mddb = new MedicalReportDBContext();
        int patient_id = Integer.parseInt(req.getParameter("patient_id"));
        int doctor_id = Integer.parseInt(req.getParameter("doctor_id"));
        String timeString = (String) req.getParameter("time");
        System.out.println(timeString);
        MedicalReport medicalReport = mddb.getFullMedicalReport(patient_id, doctor_id, timeString);
        req.setAttribute("medicalReport", medicalReport);

        UserDBContext udb = new UserDBContext();
        User patient = udb.getById(patient_id);
        req.setAttribute("patient", patient);
        User doctor = udb.getById(doctor_id);
        req.setAttribute("doctor", doctor);
        req.setAttribute("time", timeString);

        req.getRequestDispatcher("../view/doctor/create-bill.jsp").forward(req, resp);
    }
}
