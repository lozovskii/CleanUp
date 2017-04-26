package com.cleanup.dao;

import com.cleanup.model.Table;
import com.cleanup.util.exceptions.EntityStorageException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by lozov on 21.01.2017.
 */
public class TableDaoImpl extends AbstractDaoImpl<Table> implements TableDao {

    @Override
    protected void fillCreateStatement(PreparedStatement ps, Table entity) {
        try{
            ps.setString(1, entity.getName_table());
            ps.setString(2,entity.getLast_name_table());
            ps.setInt(3,entity.getPhone_number_table());
            ps.setInt(4,entity.getQuantity_table());
            ps.setDate(5,entity.getDate_table());
        }
        catch (SQLException e){
            throw new EntityStorageException("Failed to save entity: " + entity, e);
        }
    }

    @Override
    protected void fillUpdateStatement(PreparedStatement ps, Table entity) {
        try{
            ps.setString(1, entity.getName_table());
            ps.setString(2,entity.getLast_name_table());
            ps.setInt(3,entity.getPhone_number_table());
            ps.setInt(4, entity.getQuantity_table());
            ps.setDate(5,entity.getDate_table());
            ps.setLong(6, entity.getTable_id());
        }
        catch(SQLException e){
            throw new EntityStorageException("Failed to save entity: " + entity, e);
        }
    }

    @Override
    protected Table getEntity(ResultSet rs) {
        try{
            return new Table(rs);
        }catch (SQLException e){
            throw new EntityStorageException("Failed to save employee entity", e);
        }
    }

    @Override
    protected String[] getGeneratedColumn() {
        return new String[] {"table_id"};
    }

    @Override
    protected String getCreateQuery() {
        return this.dataBaseManager.getQuery("create.table");
    }

    @Override
    protected String getFindOneQuery() {
        return this.dataBaseManager.getQuery("find.table");
    }

    @Override
    protected String getUpdateQuery() {
        return this.dataBaseManager.getQuery("update.table");
    }

    @Override
    protected String getDeleteQuery() {
        return this.dataBaseManager.getQuery("delete.table");
    }
}
