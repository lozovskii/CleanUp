package com.cleanup.dao;

import com.cleanup.model.Room;
import com.cleanup.util.exceptions.EntityStorageException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by lozov on 19.01.2017.
 */
public class RoomDaoImpl extends AbstractDaoImpl<Room> implements RoomDao  {

    @Override
    protected void fillCreateStatement(PreparedStatement ps, Room entity) {
        try{
            ps.setString(1, entity.getName_room());
            ps.setString(2,entity.getLast_name_room());
            ps.setInt(3,entity.getPhone_number_room());
            ps.setInt(4,entity.getQuantity_room());
            ps.setDate(5,entity.getDate_room());
        }
        catch (SQLException e){
            throw new EntityStorageException("Failed to save entity: " + entity, e);
        }
    }

    @Override
    protected void fillUpdateStatement(PreparedStatement ps, Room entity) {
        try{
            ps.setString(1, entity.getName_room());
            ps.setString(2,entity.getLast_name_room());
            ps.setInt(3,entity.getPhone_number_room());
            ps.setInt(4, entity.getQuantity_room());
            ps.setDate(5,entity.getDate_room());
            ps.setLong(6, entity.getRoom_id());
        }
        catch(SQLException e){
            throw new EntityStorageException("Failed to save entity: " + entity, e);
        }
    }

    @Override
    protected Room getEntity(ResultSet rs) {
        try{
            return new Room(rs);
        }catch (SQLException e){
            throw new EntityStorageException("Failed to save employee entity", e);
        }
    }

    @Override
    protected String[] getGeneratedColumn() {
        return new String[] {"room_id"};
    }

    @Override
    protected String getCreateQuery() {
        return this.dataBaseManager.getQuery("create.room");
    }

    @Override
    protected String getFindOneQuery() {
        return this.dataBaseManager.getQuery("find.room");
    }

    @Override
    protected String getUpdateQuery() {
        return this.dataBaseManager.getQuery("update.room");
    }

    @Override
    protected String getDeleteQuery() {
        return this.dataBaseManager.getQuery("delete.room");
    }

}
