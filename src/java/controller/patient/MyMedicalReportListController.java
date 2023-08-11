/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.patient;

import dal.MedicalReportDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Drug;
import model.MedicalReport;
import model.Treatment;
import util.DateTimeHelper;

/**
 *
 * @author nguye
 */
public class MyMedicalReportListController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String patientId_raw = request.getParameter("patientId");
        if (patientId_raw != null && !"".equals(patientId_raw)) {
            int patientId = Integer.parseInt(patientId_raw);
            MedicalReportDBContext medicalReportDBContext = new MedicalReportDBContext();
            ArrayList<MedicalReport> medicalReports = new ArrayList<>();
            ArrayList<MedicalReport> medicalReportsPernament = medicalReportDBContext.getPatientMedicalReports(patientId);
            String doctorId_raw = request.getParameter("doctorId");
            String fromDate = request.getParameter("fromDate");
            String toDate = request.getParameter("toDate");
            //Lấy list doctor
            Set<Integer> uniqueDoctorIds = new HashSet<>();
            for (MedicalReport mr : medicalReportsPernament) {
                uniqueDoctorIds.add(mr.getDoctor_id());
            }
            request.setAttribute("uniqueDoctorIds", uniqueDoctorIds);
            if (fromDate == null && toDate == null && medicalReportsPernament.size()>0) {
                // Lấy thời gian của bản ghi đầu tiên
                MedicalReport firstReport = medicalReportsPernament.get(0);
                try {
                    java.sql.Date firstTime = DateTimeHelper.getDateRemoveTime(firstReport.getTime());
                    request.setAttribute("firstTime", firstTime);
                } catch (ParseException ex) {
                    Logger.getLogger(MyMedicalReportListController.class.getName()).log(Level.SEVERE, null, ex);
                }
                // Lấy thời gian của bản ghi cuối
                MedicalReport lastReport = medicalReportsPernament.get(medicalReportsPernament.size() - 1);
                try {
                    java.sql.Date lastTime = DateTimeHelper.getDateRemoveTime(lastReport.getTime());
                    request.setAttribute("lastTime", lastTime);
                } catch (ParseException ex) {
                    Logger.getLogger(MyMedicalReportListController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }else{
                request.setAttribute("firstTime", fromDate);
                 request.setAttribute("lastTime", toDate);
            }
            
            if (doctorId_raw == null || "".equals(doctorId_raw) || doctorId_raw.equals("all")) {
                medicalReports = medicalReportDBContext.getPatientMedicalReports(patientId);
                if (fromDate != null && toDate != null) {
                    medicalReports = medicalReportDBContext.SearchMedicalReportsNoDoctorId(patientId, fromDate, toDate);
                }
            } else if (doctorId_raw != null && !"".equals(doctorId_raw)) {
                int doctorId = Integer.parseInt(doctorId_raw);
                medicalReports = medicalReportDBContext.getMedicalReportsByPatientIdAndDoctorId(patientId, doctorId);
                if (fromDate != null && toDate != null) {
                    medicalReports = medicalReportDBContext.SearchMedicalReports(patientId, doctorId, fromDate, toDate);
                }
            }

            request.setAttribute("medicalReports", medicalReports);

            request.getRequestDispatcher("/view/patient/ListMedicalRecords.jsp").forward(request, response);
        } else {
            response.sendRedirect("/SWP391_Project/login");
        }

        //processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String patientId_raw = request.getParameter("patientId");

        if (patientId_raw != null && !"".equals(patientId_raw)) {
            int patientId = Integer.parseInt(patientId_raw);

            String time = request.getParameter("timeString");
            MedicalReportDBContext mrContext = new MedicalReportDBContext();
            int doctorId = Integer.parseInt(request.getParameter("doctorId"));
            MedicalReport medicalReport = mrContext.getByPK(time, patientId, doctorId);
            ArrayList<Treatment> treatments = mrContext.getListTreatment(patientId, doctorId, time);
            ArrayList<Drug> drugs = mrContext.getListDrug(patientId, doctorId, time);

            ArrayList<MedicalReport> medicalReportsPernament = mrContext.getPatientMedicalReports(patientId);

            request.setAttribute("drugs", drugs);
            request.setAttribute("treatments", treatments);
            request.setAttribute("medicalReport", medicalReport);
            //lấy list doctor
            Set<Integer> uniqueDoctorIds = new HashSet<>();
            for (MedicalReport mr : medicalReportsPernament) {
                uniqueDoctorIds.add(mr.getDoctor_id());
            }
            request.setAttribute("uniqueDoctorIds", uniqueDoctorIds);
            // Lấy thời gian của bản ghi đầu tiên
            MedicalReport firstReport = medicalReportsPernament.get(0);
            try {
                java.sql.Date firstTime = DateTimeHelper.getDateRemoveTime(firstReport.getTime());
                request.setAttribute("firstTime", firstTime);
            } catch (ParseException ex) {
                Logger.getLogger(MyMedicalReportListController.class.getName()).log(Level.SEVERE, null, ex);
            }
            // Lấy thời gian của bản ghi cuối
            MedicalReport lastReport = medicalReportsPernament.get(medicalReportsPernament.size() - 1);
            try {
                java.sql.Date lastTime = DateTimeHelper.getDateRemoveTime(lastReport.getTime());
                request.setAttribute("lastTime", lastTime);
            } catch (ParseException ex) {
                Logger.getLogger(MyMedicalReportListController.class.getName()).log(Level.SEVERE, null, ex);
            }

            String fromDate = request.getParameter("fromDate");
            String toDate = request.getParameter("toDate");
            String paramDoctorId = request.getParameter("paramDoctorId");
            ArrayList<MedicalReport> medicalReports = new ArrayList<>();
            if (paramDoctorId.equals("all")) {
                medicalReports = mrContext.getPatientMedicalReports(patientId);

            } else {
                medicalReports = mrContext.SearchMedicalReports(patientId, doctorId, fromDate, toDate);
            }
            request.setAttribute("medicalReports", medicalReports);
            request.getRequestDispatcher("/view/patient/ListMedicalRecords.jsp").forward(request, response);
        } else {
            response.sendRedirect("/SWP391_Project/login");
        }

        // processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
