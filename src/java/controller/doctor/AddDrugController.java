/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.doctor;

import controller.auth.BaseRoleController;
import dal.DrugDBContext;
import dal.MedicalReportDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import model.Drug;
import model.MedicalReport;
import model.User;
import util.DateTimeHelper;

/**
 *
 * @author nguye
 */
public class AddDrugController extends BaseRoleController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        MedicalReportDBContext mddb = new MedicalReportDBContext();
        int doctor_id = Integer.parseInt(req.getParameter("doctor_id"));
        int patient = Integer.parseInt(req.getParameter("patient_id"));
        int drug_id = Integer.parseInt(req.getParameter("drug"));
        String timeString = req.getParameter("time");

        MedicalReport medicalReport = new MedicalReport();
        medicalReport.setDoctor_id(doctor_id);
        medicalReport.setPatient_id(patient);

        LocalDateTime time = DateTimeHelper.toLocalDateTime(timeString);
        medicalReport.setTime(time);

        mddb.addDrug(medicalReport, drug_id);
        req.getRequestDispatcher("../view/doctor/add-drug.jsp").forward(req, resp);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        //Get list drug in Drug table
        DrugDBContext ddb = new DrugDBContext();
        ArrayList<Drug> drugs = ddb.list();
        req.setAttribute("drugs", drugs);

        //Get list drug of medical report
        User patient = (User) req.getSession().getAttribute("patient");
        User doctor = (User) req.getSession().getAttribute("user");
        String timeString = (String) req.getSession().getAttribute("time");
        int patient_id = patient.getId();
        int doctor_id = doctor.getId();

        MedicalReportDBContext mddb = new MedicalReportDBContext();

        //Set reportDrugs attribute
        if (req.getParameter("action").equals("view")) {
            ArrayList<Drug> reportDrugs = mddb.getListDrug(patient_id, doctor_id, timeString);
            req.setAttribute("reportDrugs", reportDrugs);
            req.getRequestDispatcher("../view/doctor/add-drug.jsp").forward(req, resp);
        } else if (req.getParameter("action").equals("delete")) {
            int drug_id = Integer.parseInt(req.getParameter("drug_id"));
            mddb.deleteDrug(patient_id, doctor_id, timeString, drug_id);
            ArrayList<Drug> reportDrugs = mddb.getListDrug(patient_id, doctor_id, timeString);
            req.setAttribute("reportDrugs", reportDrugs);
            req.getRequestDispatcher("../view/doctor/add-drug.jsp").forward(req, resp);
        }

    }

}
