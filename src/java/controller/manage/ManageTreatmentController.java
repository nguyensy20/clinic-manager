/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manage;

import dal.ServiceDBContext;
import dal.TreatmentDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Service;
import model.Treatment;

/**
 *
 * @author vkhoa
 */
public class ManageTreatmentController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManageTreatmentController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageTreatmentController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        String action = request.getParameter("action");
        TreatmentDBContext treatmentContext = new TreatmentDBContext();
        if (action == null) {
            ArrayList<Treatment> treatments = treatmentContext.list();
            request.setAttribute("treatments", treatments);
            request.getRequestDispatcher("/view/admin/ListTreatment.jsp").forward(request, response);
        }
        if ("edit".equals(request.getParameter("action"))) {
            int treatmentId = Integer.parseInt(request.getParameter("id"));
            Treatment treatment = treatmentContext.get(treatmentId);

            request.setAttribute("treatment", treatment);
            request.getRequestDispatcher("/view/admin/EditTreatment.jsp").forward(request, response);
        }
        if ("create".equals(request.getParameter("action"))) {
            request.getRequestDispatcher("/view/admin/EditTreatment.jsp").forward(request, response);
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
        TreatmentDBContext treatmentContext = new TreatmentDBContext();
        if ("edit".equals(request.getParameter("action"))) {
            Treatment treatment = new Treatment();
            int treatmentId = Integer.parseInt(request.getParameter("id"));
            String treatmentName = request.getParameter("name");
//            float treatmentPrice = Float.parseFloat(request.getParameter("price"));
            int treatmentPrice = Integer.parseInt(request.getParameter("price"));
            treatment.setId(treatmentId);
            treatment.setName(treatmentName);
            treatment.setPrice(treatmentPrice);

            treatmentContext.update(treatment);
            response.sendRedirect("/SWP391_Project/manage/treatment");
        }
        if ("create".equals(request.getParameter("action"))) {
            Treatment treatment = new Treatment();
            String treatmentName = request.getParameter("name");
//            float treatmentPrice = Float.parseFloat(request.getParameter("price"));
            int treatmentPrice = Integer.parseInt(request.getParameter("price"));
            treatment.setName(treatmentName);
            treatment.setPrice(treatmentPrice);
            treatmentContext.insert(treatment);
            response.sendRedirect("/SWP391_Project/manage/treatment");
        }
        if ("delete".equals(request.getParameter("action"))) {
            int treatmentId = Integer.parseInt(request.getParameter("id"));
            Treatment treatment = new Treatment();
            treatment.setId(treatmentId);
            treatmentContext.delete(treatment);
            response.sendRedirect("/SWP391_Project/manage/treatment");
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
