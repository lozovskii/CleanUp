package com.cleanup.service;

import com.cleanup.model.Room;

/**
 * Created by lozov on 19.01.2017.
 */
public interface RoomService {
    Room create(Room room);

    Room update(Room room);

    void delete(Long id);

    Room findOne(Long id);
}
