package com.cleanup.dao;

import com.cleanup.model.User;
import org.junit.Before;
import org.junit.Test;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.hamcrest.MatcherAssert.assertThat;

public class UserDaoImplTest {
    private UserDao userDao;

    @Before
    public void setUp() throws Exception {
        userDao = new UserDaoImpl();
    }

    @Test
    public void shouldPersistEmployee() throws Exception {
        // given
        User jake = new User("Jake", "Larson", "Jake@gmail.com", "642312342", "secure_pass");

        // when
        User savedJake = userDao.create(jake);

        // then
        assertThat(savedJake.getId(), is(notNullValue()));
    }
}