package com.cleanup.model;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by lozov on 21.01.2017.
 */
public class Table {
    
    private Long table_id;
    private String name_table;
    private String last_name_table;
    private int phone_number_table;
    private int quantity_table;
    private Date date_table;

    public Table() {}
    public Table(String name_table, String last_name_table, int phone_number_table, int quantity_table, Date date_table) {
        this.name_table = name_table;
        this.last_name_table = last_name_table;
        this.phone_number_table = phone_number_table;
        this.quantity_table = quantity_table;
        this.date_table = date_table;
    }

    public Table(ResultSet rs) throws SQLException {
        this.table_id = rs.getLong("table_id");
        this.name_table = rs.getString("name_table");
        this.last_name_table = rs.getString("last_name_table");
        this.phone_number_table = rs.getInt("phone_number_table");
        this.quantity_table = rs.getInt("quantity_table");
        this.date_table = rs.getDate("date_table");
    }

    public Long getTable_id() {
        return table_id;
    }

    public void setTable_id(Long table_id) {
        this.table_id = table_id;
    }

    public String getName_table() {
        return name_table;
    }

    public void setName_table(String name_table) {
        this.name_table = name_table;
    }

    public String getLast_name_table() {
        return last_name_table;
    }

    public void setLast_name_table(String last_name_table) {
        this.last_name_table = last_name_table;
    }

    public int getPhone_number_table() {
        return phone_number_table;
    }

    public void setPhone_number_table(int phone_number_table) {
        this.phone_number_table = phone_number_table;
    }

    public int getQuantity_table() {
        return quantity_table;
    }

    public void setQuantity_table(int quantity_table) {
        this.quantity_table = quantity_table;
    }

    public Date getDate_table() {
        return date_table;
    }

    public void setDate_table(Date date_table) {
        this.date_table = date_table;
    }

    @Override
    public String toString() {
        return "Table{" +
                "table_id=" + table_id +
                ", name_table='" + name_table + '\'' +
                ", last_name_table='" + last_name_table + '\'' +
                ", phone_number_table=" + phone_number_table +
                ", quantity_table=" + quantity_table +
                ", date_table=" + date_table +
                '}';
    }
}
