package com.cleanup.controller;

import com.cleanup.util.DataBaseManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(name = "InfoServlet", urlPatterns = "/info")
public class Info extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        int userid = 0;
        String username = null;
        String lastname = null;
        //String email1 = null;
        int phone_number = 0;
        String password = null;

        DataBaseManager dataBaseManager = DataBaseManager.getInstance();
        String selectTableSQL = "SELECT user_id, first_name, last_name, email, phone_number, password FROM register_user WHERE email = '" + email + "'";
        try {Connection connection = dataBaseManager.getConnection();
            connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(selectTableSQL);
            while (rs.next()) {
                //userid = rs.getInt("user_id");
                username = rs.getString("first_name");
                lastname = rs.getString("last_name");
                //email1 = rs.getString("email");
                phone_number = rs.getInt("phone_number");
                password = rs.getString("password");
                //for html

            }

            session.setAttribute("userid", session.getAttribute("email"));
            session.setAttribute("first_name", username);
            session.setAttribute("lastname", lastname);
            //session.setAttribute("email", email);
            session.setAttribute("phone_number", phone_number);
            session.setAttribute("password", password);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        getServletContext().getRequestDispatcher("/OwnPage.jsp").forward(request, response);
    }
}
