package controller.common;

import controller.auth.BaseRoleController;
import dal.UserDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.User;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author nguye
 */
public class UserProfileController extends BaseRoleController {

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException {
        processRequest(request, response);

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/common/user-profile.jsp").forward(request, response);
    }

}
