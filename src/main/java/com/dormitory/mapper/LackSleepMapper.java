package com.dormitory.mapper;

import com.dormitory.entity.LackSleep;

import java.util.List;

public interface LackSleepMapper {
    public List<LackSleep> list();
    public void save(LackSleep lackSleep);
    public List<LackSleep> searchByBuildingName(String value);
    public List<LackSleep> searchByDormitoryName(String value);
    public List<LackSleep> searchByStudentName(String value);
    public List<LackSleep> searchByReason(String value);
}
