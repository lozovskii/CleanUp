package com.cleanup.controller;

import com.cleanup.util.DataBaseManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.Objects;

/**
 * Created by lozov on 21.01.2017.
 */
@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("Email");
        String pass = request.getParameter("pass");



        if((Objects.equals(email, "admin@gmail.com"))&&(Objects.equals(pass, "admin"))){
            request.getRequestDispatcher("AdminPage.jsp").forward(request,response);

        }else if(!Objects.equals(email, "admin@gmail.com")&&(!Objects.equals(pass, "admin"))){

            try {
                DataBaseManager dataBaseManager = DataBaseManager.getInstance();
                Connection connection = dataBaseManager.getConnection();
                CallableStatement pc=connection.prepareCall("{call FindUserLogin(?, ?, ?)}");
                pc.setString(1, email);
                pc.setString(2, pass);

                pc.registerOutParameter(3, Types.INTEGER);
                pc.executeQuery();
                boolean existUser = (int) pc.getObject(3) == 1;
                pc.close();
                if(existUser){
                    session.setAttribute("email", email);
                }else{
                    request.setAttribute("parametr1", "exist User, try another");
                }

            }catch (SQLException e){
                System.out.println(e.getMessage());
            }
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}
