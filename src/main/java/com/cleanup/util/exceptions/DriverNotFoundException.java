package com.cleanup.util.exceptions;

public class DriverNotFoundException extends RuntimeException {
    public DriverNotFoundException(String msg, ClassNotFoundException e) {
        super(msg, e);
    }
}
