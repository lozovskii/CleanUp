package com.cleanup.controller;

import com.cleanup.model.Table;
import com.cleanup.service.*;
import com.cleanup.util.DataBaseManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "RegistrationServletTable", urlPatterns = "/registrationTable")
public class RegistrationServletTable extends HttpServlet {

    private TableService tableService;

    public RegistrationServletTable() {
        this.tableService = new TableServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name_table = request.getParameter("TableName");
        String table_email = request.getParameter("TableSurName");
        int table_phone = Integer.parseInt(request.getParameter("TablePhone"));
        int quantity_man_table = Integer.parseInt(request.getParameter("quantityMansTable"));
        Date table_date = Date.valueOf(request.getParameter("TableDate"));

        try {
            DataBaseManager dataBaseManager = DataBaseManager.getInstance();
            Connection connection = dataBaseManager.getConnection();
            CallableStatement pc = connection.prepareCall("{call PROCEDURE7(?, ?, ?, ?, ?, ?)}");
            pc.setString(1, table_email);
            pc.setDate(2, table_date);
            pc.setString(3, name_table);
            pc.setInt(4, table_phone);
            pc.setInt(5, quantity_man_table);

            pc.registerOutParameter(6, Types.INTEGER);
            pc.executeQuery();
            boolean busy = (int) pc.getObject(6) == 0;
            pc.close();
            if (busy) {
                //Table table = new Table(name_table, table_email, table_phone, quantity_man_table, table_date);
                //this.tableService.create(table);
                //request.setAttribute("parametr1", "Successfully Order");
                request.setAttribute("parametr1", "sorry, but all tables is blocked in this day, try change date");
            } else {
                request.setAttribute("parametr1", "OK");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}