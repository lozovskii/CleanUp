package com.cleanup.service;

import com.cleanup.model.Table;

public interface TableService {
    Table create(Table table);

    Table update(Table table);

    void delete(Long id);

    Table findOne(Long id);
}
