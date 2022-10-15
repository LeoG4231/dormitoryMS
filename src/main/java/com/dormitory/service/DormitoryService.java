package com.dormitory.service;

import com.dormitory.entity.Dormitory;

import java.util.List;

public interface DormitoryService {
    public List<Dormitory> list();
    public void save(Dormitory dormitory);
    public void del(Integer id);
    public void update(Dormitory dormitory);
    public List<Dormitory> search(String key,String value);
}
