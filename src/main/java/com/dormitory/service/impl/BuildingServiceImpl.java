package com.dormitory.service.impl;

import com.dormitory.entity.Building;
import com.dormitory.mapper.BuildingMapper;
import com.dormitory.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BuildingServiceImpl implements BuildingService {

    @Autowired
    private BuildingMapper buildingMapper;

    @Override
    public List<Building> list() {
        return buildingMapper.list();
    }

    @Override
    public List<Building> search(String key,String value) {
        if (key.equals("")) return buildingMapper.list();
        List<Building> list = null;
        switch (key){
            case "name":
                list = buildingMapper.searchByName(value);
                break;
            case "introduction":
                list = buildingMapper.searchByIntroduction(value);
                break;
            case "adminName":
                list = buildingMapper.searchByAdminName(value);
                break;
        }
        return list;
    }

    @Override
    public void save(Building building) {
        try {
            buildingMapper.save(building);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Building building) {
        try {
            buildingMapper.update(building);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Integer id) {
        try {
            buildingMapper.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
