package com.cleanup.dao;

// generics
public interface AbstractDao<T, ID> {

    T create(T entity);

    T update(T entity);

    T findOne(ID id);

    void delete(ID id);
}
