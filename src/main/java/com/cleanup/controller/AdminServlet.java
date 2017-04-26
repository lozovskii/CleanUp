package com.cleanup.controller;

import com.cleanup.service.AdminService;
import com.cleanup.service.AdminServiceImpl;
import com.cleanup.util.DataBaseManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by lozov on 20.01.2017.
 */
@WebServlet(name = "AdminServlet", urlPatterns = "/adminka")
public class AdminServlet extends HttpServlet{
    private AdminService adminService;

    public AdminServlet() {
        this.adminService = new AdminServiceImpl();
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //HttpSession session = request.getSession();
        String email = request.getParameter("email");

        DataBaseManager dataBaseManager = DataBaseManager.getInstance();
        String selectTableSQL = "DELETE FROM register_user WHERE email = '" + email + "'";
        try {
            Connection connection = dataBaseManager.getConnection();
            Statement statement = connection.createStatement();
            statement.executeUpdate(selectTableSQL);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
    }
}
