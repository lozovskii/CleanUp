package com.cleanup.model;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by lozov on 19.01.2017.
 */
public class Room {

    private Long room_id;
    private String name_room;
    private String last_name_room;//room_email
    private int phone_number_room;
    private int quantity_room;
    private Date date_room;

    public Room() {}
    public Room(String name_room, String last_name_room, int phone_number_room, int quantity_room, Date date_room) {
        this.name_room = name_room;
        this.last_name_room = last_name_room;
        this.phone_number_room = phone_number_room;
        this.quantity_room = quantity_room;
        this.date_room = date_room;
    }


    public Room(ResultSet rs) throws SQLException {
        this.room_id = rs.getLong("room_id");
        this.name_room = rs.getString("name_room");
        this.last_name_room = rs.getString("last_name_room");
        this.phone_number_room = rs.getInt("phone_number_room");
        this.quantity_room = rs.getInt("quantity_room");
        this.date_room = rs.getDate("date_room");
    }



    public int getQuantity_room() {
        return quantity_room;
    }

    public void setQuantity_room(int quantity_room) {
        this.quantity_room = quantity_room;
    }

    public String getLast_name_room() {
        return last_name_room;
    }

    public void setLast_name_room(String last_name_room) {
        this.last_name_room = last_name_room;
    }

    public int getPhone_number_room() {
        return phone_number_room;
    }

    public void setPhone_number_room(int phone_number_room) {
        this.phone_number_room = phone_number_room;
    }

    public Date getDate_room() {
        return date_room;
    }

    public void setDate_room(Date date_room) {
        this.date_room = date_room;
    }
    public String getName_room() {return name_room;}
    public void setName_room(String name_room){this.name_room = name_room;}
    public Long getRoom_id() {return room_id;}
    public void setRoom_id(Long room_id) {this.room_id = room_id;}

    @Override
    public String toString() {
        return "Room{" +
                "room_id=" + room_id +
                ", name_room='" + name_room + '\'' +
                ", last_name_room='" + last_name_room + '\'' +
                ", phone_number_room=" + phone_number_room +
                ", quantity_room=" + quantity_room +
                ", date_room=" + date_room +
                '}';
    }
}
