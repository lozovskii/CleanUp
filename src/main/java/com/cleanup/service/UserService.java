package com.cleanup.service;

import com.cleanup.model.User;

public interface UserService {
    User create(User user);

    User update(User user);

    void delete(Long id);

    User findOne(Long id);
}
