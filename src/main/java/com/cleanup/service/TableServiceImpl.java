package com.cleanup.service;

import com.cleanup.dao.TableDao;
import com.cleanup.dao.TableDaoImpl;
import com.cleanup.model.Table;

public class TableServiceImpl implements TableService{
    private TableDao tableService;

    public TableServiceImpl() {
        this.tableService = new TableDaoImpl();
    }

    @Override
    public Table create(Table table) {
        return this.tableService.create(table);
    }

    @Override
    public Table update(Table table) {
        return this.tableService.update(table);
    }

    @Override
    public void delete(Long id) {
        this.tableService.delete(id);
    }

    @Override
    public Table findOne(Long id) {
        return this.tableService.findOne(id);
    }
}
