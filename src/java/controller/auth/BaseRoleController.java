/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Feature;
import model.Role;
import model.User;

/**
 *
 * @author nguye
 */
public abstract class BaseRoleController extends BaseAuthenticationController{
    private boolean isAuthorized(HttpServletRequest req) {
        User account = (User) req.getSession().getAttribute("user");
        String currentUrl = req.getServletPath();//"/student/add"
        for (Role role : account.getRoles()) {
            for (Feature feature : role.getFeatures()) {
                if (feature.getUrl().equals(currentUrl)) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (isAuthorized(req)) {
            processPost(req, resp, (User) req.getSession().getAttribute("user"));
        } else {
            resp.getWriter().println("access denied!");
            resp.sendRedirect("../home");
        }
    }

    protected abstract void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException;

    protected abstract void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException;

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (isAuthorized(req)) {
            processGet(req, resp, (User) req.getSession().getAttribute("user"));
        } else {
            resp.getWriter().println("access denied!");
            resp.sendRedirect("../home");
        }
    }
}
