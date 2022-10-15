package com.dormitory.service;

import com.dormitory.entity.LackSleep;

import java.util.List;

public interface LackSleepService {
    public List<LackSleep> list();
    public void save(LackSleep lackSleep);
    public List<LackSleep> search(String key,String value);
}
