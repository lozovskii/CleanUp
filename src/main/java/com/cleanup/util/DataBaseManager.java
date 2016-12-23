package com.cleanup.util;

import com.cleanup.util.exceptions.DriverNotFoundException;
import com.cleanup.util.exceptions.PropertyAccessException;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DataBaseManager {
    private static final String USER_NAME = "jdbc.username";
    private static final String PASSWORD = "jdbc.password";
    private static final String DRIVER = "jdbc.driver";
    private static final String URL = "jdbc.url";

    private static final String ORACLE_PROPERTIES = "/oracle.properties";
    private static final String QUERY_PROPERTIES = "/query.properties";

    private Properties env;
    private Properties queries;

    private static DataBaseManager instance;

    public static DataBaseManager getInstance() {
        if (instance == null) {
            instance = new DataBaseManager();
        }
        return instance;
    }

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection(env.getProperty(URL), env.getProperty(USER_NAME), env.getProperty(PASSWORD));
    }

    public String getQuery(String name) {
        if (this.queries == null)
            this.queries = this.loadProperties(QUERY_PROPERTIES);
        return this.queries.getProperty(name);
    }

    private DataBaseManager() {
        this.env = this.loadProperties(ORACLE_PROPERTIES);
        this.loadDriver();
    }

    private void loadDriver() {
        try {
            Class.forName(env.getProperty(DRIVER));
        } catch (ClassNotFoundException e) {
            throw new DriverNotFoundException("JDBC driver is missing: " + env.getProperty(DRIVER), e);
        }
    }

    private Properties loadProperties(String location) {
        try (InputStream in = this.getClass().getResourceAsStream(location)) {
            Properties prop = new Properties();
            prop.load(in);
            return prop;
        } catch (IOException e) {
            throw new PropertyAccessException("Failed to load properties: " + location, e);
        }
    }
}
