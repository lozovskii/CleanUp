package com.cleanup.controller;

import com.cleanup.model.Room;
import com.cleanup.service.*;
import com.cleanup.util.DataBaseManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "RegistrationServletRoom", urlPatterns = "/registrationRoom")
public class RegistrationServletRoom extends HttpServlet {

    private RoomService roomService;

    public RegistrationServletRoom() {
        this.roomService = new RoomServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name_room = request.getParameter("RoomName");
        String room_email = request.getParameter("RoomEmail");
        int room_phone = Integer.parseInt(request.getParameter("RoomPhone"));
        int quantity_man = Integer.parseInt(request.getParameter("QuantityMansRoom"));
        Date room_date = Date.valueOf(request.getParameter("RoomDate"));

        try {
            DataBaseManager dataBaseManager = DataBaseManager.getInstance();
            Connection connection = dataBaseManager.getConnection();
            CallableStatement pc = connection.prepareCall("{call PROCEDURE6(?, ?, ?, ?, ?, ?)}");
            pc.setString(1, room_email);
            pc.setDate(2, room_date);
            pc.setString(3, name_room);
            pc.setInt(4, room_phone);
            pc.setInt(5, quantity_man);

            pc.registerOutParameter(6, Types.INTEGER);
            pc.executeQuery();
            boolean busy = (int) pc.getObject(6) == 0;
            pc.close();
            if (busy) {
//                Room room = new Room(name_room, room_email, room_phone, quantity_man, room_date);
//                this.roomService.create(room);
//                request.setAttribute("parametr1", "Successfully Order");
                request.setAttribute("parametr1", "sorry, but all room is blocked in this day, try change date");
            } else {
                request.setAttribute("parametr1", "OK");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}