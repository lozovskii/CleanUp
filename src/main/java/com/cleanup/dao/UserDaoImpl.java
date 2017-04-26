package com.cleanup.dao;

import com.cleanup.model.User;
import com.cleanup.util.exceptions.EntityStorageException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDaoImpl extends AbstractDaoImpl<User> implements UserDao {

    @Override
    protected void fillCreateStatement(PreparedStatement ps, User entity) {
        try {
            ps.setString(1, entity.getFirstName());
            ps.setString(2, entity.getLastName());
            ps.setString(3, entity.getEmail());
            ps.setString(4, entity.getPhone());
            ps.setString(5, entity.getPassword());
        } catch (SQLException e) {
            throw new EntityStorageException("Failed to save entity: " + entity, e);
        }
    }

    @Override
    protected void fillUpdateStatement(PreparedStatement ps, User entity) {
        try {
            ps.setString(1, entity.getFirstName());//(№of "?" in properties, entity.getFirstName)
            ps.setString(2, entity.getLastName());
            ps.setString(3, entity.getEmail());
            ps.setString(4, entity.getPhone());
            ps.setString(5, entity.getPassword());
            ps.setLong(6, entity.getId());
        } catch (SQLException e) {
            throw new EntityStorageException("Failed to save entity: " + entity, e);
        }
    }

    @Override
    protected User getEntity(ResultSet rs) {
        try {
            return new User(rs);
        } catch (SQLException e) {
            throw new EntityStorageException("Failed to save employee entity", e);
        }
    }

    @Override
    protected String[] getGeneratedColumn(){
        return new String[] {"user_id"};
    }

    @Override
    protected String getCreateQuery() {
        return this.dataBaseManager.getQuery("create.user");
    }

    @Override
    protected String getFindOneQuery() {
        return this.dataBaseManager.getQuery("find.user");
    }

    @Override
    protected String getUpdateQuery() {
        return this.dataBaseManager.getQuery("update.user");
    }

    @Override
    protected String getDeleteQuery() {
        return this.dataBaseManager.getQuery("delete.user");
    }

}
