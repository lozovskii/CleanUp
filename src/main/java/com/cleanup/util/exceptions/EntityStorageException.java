package com.cleanup.util.exceptions;

import java.sql.SQLException;

/**
 * Created by ivan on 23.12.16.
 */
public class EntityStorageException extends RuntimeException {
    public EntityStorageException(String s, SQLException e) {
        super(s, e);
    }
}
