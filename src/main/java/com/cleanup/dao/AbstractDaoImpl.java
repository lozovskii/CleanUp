package com.cleanup.dao;

import com.cleanup.util.DataBaseManager;
import com.cleanup.util.exceptions.EntityStorageException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public abstract class AbstractDaoImpl<T> implements AbstractDao<T, Long> {
    DataBaseManager dataBaseManager = DataBaseManager.getInstance();

    @Override
    public T create(T entity) {
        try (Connection connection = this.dataBaseManager.getConnection();
             PreparedStatement ps = this.createPreparedStatement(connection, entity);
             ResultSet rs = ps.getGeneratedKeys()) {

            if (rs.next()) {
                Long generatedId = rs.getLong(1);
                return this.findOne(generatedId);
            }
        } catch (SQLException e) {
            throw new EntityStorageException("Failed to save entity: " + entity, e);
        }
        return null;
    }

    @Override
    public T findOne(Long id) {
        try (Connection connection = this.dataBaseManager.getConnection();
             PreparedStatement ps = this.getByIdPreparedStatement(connection, id);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return getEntity(rs);
            }
        } catch (SQLException e) {
            throw new EntityStorageException("Failed to fetch entity with id: " + id, e);
        }
        return null;
    }

    @Override
    public void delete(Long id) {
        try (Connection connection = this.dataBaseManager.getConnection();
             PreparedStatement ps = this.getDeletePreparedStatement(connection, id)) {

            ps.executeUpdate();
        } catch (SQLException e) {
            throw new EntityStorageException("Failed to delete entity with id: " + id, e);
        }
    }

    @Override
    public T update(T entity) {
        try (Connection connection = this.dataBaseManager.getConnection();
             PreparedStatement ps = this.getUpdatePreparedStatement(connection, entity)) {

            ps.executeUpdate();
            return entity;
        } catch (SQLException e) {
            throw new EntityStorageException("Failed to update entity: " + entity, e);
        }
    }

    private PreparedStatement getUpdatePreparedStatement(Connection connection, T entity) throws SQLException {
        String query = this.getUpdateQuery();
        PreparedStatement ps = connection.prepareStatement(query);
        this.fillUpdateStatement(ps, entity);

        return ps;
    }

    private PreparedStatement getDeletePreparedStatement(Connection connection, Long id) throws SQLException {
        String query = this.getDeleteQuery();
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setLong(1, id);

        return ps;
    }

    private PreparedStatement getByIdPreparedStatement(Connection connection, Long id) throws SQLException {
        String query = this.getFindOneQuery();
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setLong(1, id);

        return ps;
    }

    private PreparedStatement createPreparedStatement(Connection connection, T entity) throws SQLException {
        String query = this.getCreateQuery();
        String[] generatedColumns = {"id"};
        PreparedStatement ps = connection.prepareStatement(query, generatedColumns);
        this.fillCreateStatement(ps, entity);
        ps.executeUpdate();

        return ps;
    }

    protected abstract void fillCreateStatement(PreparedStatement ps, T entity);

    protected abstract void fillUpdateStatement(PreparedStatement ps, T entity);

    protected abstract T getEntity(ResultSet rs);

    protected abstract String getCreateQuery();

    protected abstract String getFindOneQuery();

    protected abstract String getUpdateQuery();

    protected abstract String getDeleteQuery();
}
