package com.cleanup.util.exceptions;

import java.io.IOException;

public class PropertyAccessException extends RuntimeException {
    public PropertyAccessException(String msg, IOException e) {
        super(msg,e);
    }
}
