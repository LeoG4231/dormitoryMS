package com.dormitory.service.impl;

import com.dormitory.entity.MoveRecord;
import com.dormitory.mapper.RecordMapper;
import com.dormitory.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecordServiceImpl implements RecordService {

    @Autowired
    private RecordMapper recordMapper;

    @Override
    public List<MoveRecord> list() {
        return recordMapper.list();
    }

    @Override
    public List<MoveRecord> search(String key, String value) {
        if (key.equals("")) return null;
        List<MoveRecord> moveRecords = null;
        switch (key){
            case "studentName":
                moveRecords = recordMapper.searchByStudentName(value);
                break;
            case "dormitoryName":
                moveRecords = recordMapper.searchByDormitoryName(value);
                break;
            case "reason":
                moveRecords = recordMapper.searchByReason(value);
                break;
        }
        return moveRecords;
    }
}
