package controller.patient;

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
public class MyBillController extends BaseRoleController {

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
        int patient_id = ((User) req.getSession().getAttribute("user")).getId();
        int doctor_id = Integer.parseInt(req.getParameter("doctor_id"));
        String timeString = req.getParameter("time");
        MedicalReport medicalReport = mddb.getFullMedicalReport(patient_id, doctor_id, timeString);
        req.setAttribute("medicalReport", medicalReport);

        UserDBContext udb = new UserDBContext();
        User patient = udb.getById(patient_id);
        req.setAttribute("patient", patient);
        User doctor = udb.getById(doctor_id);
        req.setAttribute("doctor", doctor);
        req.setAttribute("time", timeString);

        req.getRequestDispatcher("../view/patient/my-bill-detail.jsp").forward(req, resp);
    }
}

