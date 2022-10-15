package com.dormitory.service;

import com.dormitory.entity.MoveRecord;

import java.util.List;

public interface RecordService {
    public List<MoveRecord> list();
    public List<MoveRecord> search(String key,String value);
}
