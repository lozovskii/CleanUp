package com.cleanup.service;

import com.cleanup.dao.RoomDao;
import com.cleanup.dao.RoomDaoImpl;
import com.cleanup.model.Room;


public class RoomServiceImpl implements RoomService {
    private RoomDao roomDao;

    public RoomServiceImpl() {
        this.roomDao = new RoomDaoImpl();
    }

    @Override
    public Room create(Room room) {
        return this.roomDao.create(room);
    }

    @Override
    public Room update(Room room) {
        return this.roomDao.update(room);
    }

    @Override
    public void delete(Long id) {
        this.roomDao.delete(id);
    }

    @Override
    public Room findOne(Long id) {
        return this.roomDao.findOne(id);
    }
}
