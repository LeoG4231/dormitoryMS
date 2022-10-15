package com.dormitory.mapper;

import com.dormitory.entity.MoveRecord;

import java.util.List;

public interface RecordMapper {
    public List<MoveRecord> list();
    public List<MoveRecord> searchByStudentName(String value);
    public List<MoveRecord> searchByDormitoryName(String value);
    public List<MoveRecord> searchByReason(String value);
}
