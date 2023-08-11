/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.User;

/**
 *
 * @author nguye
 */
public abstract class BaseAuthenticationController extends HttpServlet{
    private boolean isAuthenticated(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        return user != null;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (isAuthenticated(req)) {
            //process business
            processPost(req, resp);
        } else {
            resp.getWriter().println("access denied!");
            resp.sendRedirect("../home");
        }
    }

    protected abstract void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;

    protected abstract void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (isAuthenticated(req)) {
            //process business
            processGet(req, resp);
        } else {
            resp.getWriter().println("access denied!");
            resp.sendRedirect("../home");

        }
    }
}
