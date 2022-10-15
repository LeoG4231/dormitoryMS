package com.dormitory.service.impl;

import com.dormitory.entity.LackSleep;
import com.dormitory.mapper.LackSleepMapper;
import com.dormitory.service.LackSleepService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LackSleepServiceImpl implements LackSleepService {

    @Autowired
    LackSleepMapper lackSleepMapper;

    @Override
    public List<LackSleep> list() {
        return lackSleepMapper.list();
    }

    @Override
    public void save(LackSleep lackSleep) {
        lackSleepMapper.save(lackSleep);
    }

    @Override
    public List<LackSleep> search(String key, String value) {
        if (key.equals("")) return null;
        List<LackSleep> lackSleeps = null;
        switch (key){
            case "buildingName":
                lackSleeps = lackSleepMapper.searchByBuildingName(value);
                break;
            case "dormitoryName":
                lackSleeps = lackSleepMapper.searchByDormitoryName(value);
                break;
            case "studentName":
                lackSleeps = lackSleepMapper.searchByStudentName(value);
                break;
            case "reason":
                lackSleeps = lackSleepMapper.searchByReason(value);
                break;
        }
        return lackSleeps;
    }
}
