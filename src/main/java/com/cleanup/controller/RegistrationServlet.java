package com.cleanup.controller;

import com.cleanup.model.User;
import com.cleanup.service.*;
import com.cleanup.util.DataBaseManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

@WebServlet(name = "RegistrationServlet", urlPatterns = "/registration")
public class RegistrationServlet extends HttpServlet {

    private UserService userService;

    public RegistrationServlet() {
        this.userService = new UserServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        try {
            DataBaseManager dataBaseManager = DataBaseManager.getInstance();
            Connection connection = dataBaseManager.getConnection();
            CallableStatement pc=connection.prepareCall("{call FindUserRegister(?, ?)}");
            pc.setString(1, email);

            pc.registerOutParameter(2, Types.INTEGER);
            pc.executeQuery();
            boolean existUser = (int) pc.getObject(2) != 1;
            pc.close();
            if(existUser){
                User user = new User(firstName, lastName, email, phone, password);
                this.userService.create(user);
                request.setAttribute("parametr1", "Successfully");
            }else{
                request.setAttribute("parametr1", "exist User, try another");
            }
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}
