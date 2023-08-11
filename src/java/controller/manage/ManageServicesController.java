/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manage;

import dal.ServiceDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Service;

/**
 *
 * @author vkhoa
 */
public class ManageServicesController extends HttpServlet {

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
        String action = request.getParameter("action");
        ServiceDBContext serviceContext = new ServiceDBContext();
        if (action == null) {
            ArrayList<Service> services = serviceContext.list();
            request.setAttribute("services", services);
            request.getRequestDispatcher("/view/admin/ListServices.jsp").forward(request, response);
        }
        if ("edit".equals(request.getParameter("action"))) {
            int serviceId = Integer.parseInt(request.getParameter("id"));
            Service service = serviceContext.get(serviceId);
            request.setAttribute("service", service);
            request.getRequestDispatcher("/view/admin/EditService.jsp").forward(request, response);
        }
        if ("create".equals(request.getParameter("action"))) {
            request.getRequestDispatcher("/view/admin/EditService.jsp").forward(request, response);
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
       
        ServiceDBContext serviceContext = new ServiceDBContext();
        if ("edit".equals(request.getParameter("action"))) {
            Service service = new Service();
            int serviceId = Integer.parseInt(request.getParameter("id"));
            String serviceName = request.getParameter("name");
            String serviceDescription = request.getParameter("description");
            service.setId(serviceId);
            service.setName(serviceName);
            service.setDescription(serviceDescription);

            serviceContext.update(service);
            response.sendRedirect("/SWP391_Project/manage/services");
        }
        if ("create".equals(request.getParameter("action"))) {
            Service service  =  new Service();
             String serviceName = request.getParameter("name");
            String serviceDescription = request.getParameter("description");
            service.setName(serviceName);
            service.setDescription(serviceDescription);
            serviceContext.insert(service);
            response.sendRedirect("/SWP391_Project/manage/services");
        }
        if ("delete".equals(request.getParameter("action"))) {
            int serviceId = Integer.parseInt(request.getParameter("id"));
            Service service =  new Service();
            service.setId(serviceId);
            serviceContext.delete(service);
            response.sendRedirect("/SWP391_Project/manage/services");
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
