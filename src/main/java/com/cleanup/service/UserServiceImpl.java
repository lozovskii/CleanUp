package com.cleanup.service;

import com.cleanup.dao.UserDao;
import com.cleanup.dao.UserDaoImpl;
import com.cleanup.model.User;

public class UserServiceImpl implements UserService {
    private UserDao userDao;

    public UserServiceImpl() {
        this.userDao = new UserDaoImpl();
    }

    @Override
    public User create(User user) {
        return this.userDao.create(user);
    }

    @Override
    public User update(User user) {
        return this.userDao.update(user);
    }

    @Override
    public void delete(Long id) {
        this.userDao.delete(id);
    }

    @Override
    public User findOne(Long id) {
        return this.userDao.findOne(id);
    }

}