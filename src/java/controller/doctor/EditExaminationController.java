/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.doctor;

import controller.auth.BaseRoleController;
import dal.DrugDBContext;
import dal.MedicalReportDBContext;
import dal.TreatmentDBContext;
import dal.UserDBContext;
import dal.WaitingPatientDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import static java.time.LocalTime.now;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Locale;
import model.Drug;
import model.MedicalReport;
import model.Treatment;
import model.User;
import model.WaitingPatient;
import util.DateTimeHelper;

/**
 *
 * @author nguye
 */
public class EditExaminationController extends BaseRoleController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        //Get PK 
        int patient_id = ((User) req.getSession().getAttribute("patient")).getId();
        int doctor_id = ((User) req.getSession().getAttribute("user")).getId();
        String timeString = (String) req.getSession().getAttribute("time");
        LocalDateTime time = DateTimeHelper.toLocalDateTime(timeString);

        //Attribute not PK
        int pulse = Integer.parseInt(req.getParameter("pulse"));
        int bloodPress = Integer.parseInt(req.getParameter("bloodPress"));
        int breathing = Integer.parseInt(req.getParameter("breathing"));
        int height = Integer.parseInt(req.getParameter("height"));
        int weight = Integer.parseInt(req.getParameter("weight"));
        String symptoms = req.getParameter("symptoms");
        String result = req.getParameter("result");

        String note = req.getParameter("note");
        UserDBContext udb = new UserDBContext();
        udb.updateDescription(note, patient_id);
        User patient = udb.getById(patient_id);
        req.getSession().setAttribute("patient", patient);

        MedicalReport medicalReport = new MedicalReport();
        //Set PK
        medicalReport.setDoctor_id(doctor_id);
        medicalReport.setPatient_id(patient_id);
        medicalReport.setTime(time);
        //Others
        medicalReport.setBloodPress(bloodPress);
        medicalReport.setBreathing(breathing);
        medicalReport.setHeight(height);
        medicalReport.setPulse(pulse);
        medicalReport.setResult(result);
        medicalReport.setSymptom(symptoms);
        medicalReport.setWeight(weight);

        DrugDBContext ddb = new DrugDBContext();
        ArrayList<Drug> drugs = ddb.list();
        req.setAttribute("drugs", drugs);

        MedicalReportDBContext mddb = new MedicalReportDBContext();
        mddb.updateByPK(medicalReport);

        ArrayList<Treatment> treatments = mddb.getListTreatment(patient_id, doctor_id, timeString);
        ArrayList<Drug> reportDrugs = mddb.getListDrug(patient_id, doctor_id, timeString);
        req.setAttribute("treatments", treatments);
        req.setAttribute("reportDrugs", reportDrugs);

        //Tra lai trang html
        if (req.getParameter("draft") != null) {
            req.setAttribute("medicalReport", medicalReport);
            req.getRequestDispatcher("../view/doctor/edit-examination.jsp").forward(req, resp);
        } else {
            req.setAttribute("medicalReport", medicalReport);
            req.getSession().setAttribute("patient", null);
            req.getSession().setAttribute("time", null);
            WaitingPatientDBContext wpdbc = new WaitingPatientDBContext();
            wpdbc.deleteByPatientId(patient_id);
            resp.sendRedirect("waiting-patient-list");
//            req.getRequestDispatcher("waiting-patient-list/waiting-patient-list.jsp").forward(req, resp);
        }
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        //kiem tra neu trong session chua co time thi tao time moi va luw trong 
        //session, add them 1 record medical report vao database
        if (req.getSession().getAttribute("time") == null) {
            //Tim patient va luu vao session
            int patient_id = Integer.parseInt(req.getParameter("patient_id"));
            UserDBContext udb = new UserDBContext();
            User patient = udb.getById(patient_id);
            req.getSession().setAttribute("patient", patient);
            int doctor_id = ((User) req.getSession().getAttribute("user")).getId();

            // Luu 1 record vao database
            MedicalReport medicalReport = new MedicalReport();
            medicalReport.setPatient_id(patient_id);
            medicalReport.setDoctor_id(doctor_id);
            //Tao time va luu trong session
            LocalDateTime time = LocalDateTime.now();
            String timeString = DateTimeHelper.toDateTimeSql(time);
            medicalReport.setTime(time);

            MedicalReportDBContext mddb = new MedicalReportDBContext();
            mddb.insertOnlyPK(medicalReport);

            req.getSession().setAttribute("time", timeString);
            //
            req.getRequestDispatcher("../view/doctor/edit-examination.jsp").forward(req, resp);
        } else {
//            int patient_id = ((User) req.getSession().getAttribute("patient")).getId();
            int patient_id = Integer.parseInt(req.getParameter("patient_id"));
            User patient = (User) req.getSession().getAttribute("patient");

            if (patient.getId() == patient_id) {
                DrugDBContext ddb = new DrugDBContext();
                ArrayList<Drug> drugs = ddb.list();
                req.setAttribute("drugs", drugs);
                UserDBContext udb = new UserDBContext();
                patient = udb.getById(patient.getId());
                req.getSession().setAttribute("patient", patient);
                String timeString = (String) req.getSession().getAttribute("time");
                int doctor_id = ((User) req.getSession().getAttribute("user")).getId();
                MedicalReportDBContext mddb = new MedicalReportDBContext();
                MedicalReport medicalReport = mddb.getByPK(timeString, patient_id, doctor_id);
                ArrayList<Treatment> treatments = mddb.getListTreatment(patient_id, doctor_id, timeString);
                ArrayList<Drug> reportDrugs = mddb.getListDrug(patient_id, doctor_id, timeString);
                req.setAttribute("medicalReport", medicalReport);
                req.setAttribute("treatments", treatments);
                req.setAttribute("reportDrugs", reportDrugs);
                req.getRequestDispatcher("../view/doctor/edit-examination.jsp").forward(req, resp);
            } else {
                resp.getWriter().print("Cannot edit this patient because editing another patient");
            }
        }
    }

}
