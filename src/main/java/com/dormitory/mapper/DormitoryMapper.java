package com.dormitory.mapper;


import com.dormitory.entity.Dormitory;

import java.util.List;

public interface DormitoryMapper {
    public List<Dormitory> list();
    public void save(Dormitory dormitory);
    public void del(Integer id);
    public void update(Dormitory dormitory);
    public List<Dormitory> searchByBuildingName(String buildingName);
    public List<Dormitory> searchByName(String name);
    public List<Dormitory> searchByTelephone(String telephone);
    public void subAvailable(Integer value);
    public void addAvailable(Integer value);
}
