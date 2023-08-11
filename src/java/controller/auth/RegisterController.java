/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.auth;

import dal.UserDBContext;
import dal.UserHasRoleDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Math.random;
import java.sql.Date;
import java.util.Random;
import model.Role;
import model.User;

/**
 *
 * @author minh0
 */
public class RegisterController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

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
        request.getRequestDispatcher("view/common/register.jsp").forward(request, response);
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
        String raw_name = request.getParameter("name");
        String raw_gender = request.getParameter("gender");
        String raw_dob = request.getParameter("dob");
        String raw_phone = request.getParameter("phone");
        String raw_address = request.getParameter("address");
        String raw_username = request.getParameter("username");
        String raw_password = request.getParameter("passwordHash");
        
        User u = new User();
        Random random = new Random();
        u.setId(random.nextInt(1000));
        u.setName(raw_name);
        u.setGender(raw_gender.equals("male"));
        u.setDob(Date.valueOf(raw_dob));
        u.setPhone(raw_phone);
        u.setAddress(raw_address);
        u.setUsername(raw_username);
        u.setPasswordHash(raw_password);
        
        Role r = new Role();
        r.setId(u.getId());
        
        UserDBContext udb = new UserDBContext();
        udb.insert(u);
        
        UserHasRoleDBContext uhrdbv= new UserHasRoleDBContext();
        uhrdbv.insert(r);
        
        response.sendRedirect("login");
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
