package com.dormitory.service.impl;

import com.dormitory.entity.Dormitory;
import com.dormitory.mapper.DormitoryMapper;
import com.dormitory.service.DormitoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DormitoryServiceImpl implements DormitoryService {

    @Autowired
    private DormitoryMapper dormitoryMapper;

    @Override
    public List<Dormitory> list() {
        return dormitoryMapper.list();
    }

    @Override
    public void save(Dormitory dormitory) {
        dormitoryMapper.save(dormitory);
    }

    @Override
    public void del(Integer id) {
        dormitoryMapper.del(id);
    }

    @Override
    public void update(Dormitory dormitory) {
        dormitoryMapper.update(dormitory);
    }

    @Override
    public List<Dormitory> search(String key, String value) {
        if (key.equals("")) return null;
        List<Dormitory> list = null;
        switch (key){
            case "buildingName":
                list = dormitoryMapper.searchByBuildingName(value);
                break;
            case "name":
                list = dormitoryMapper.searchByName(value);
                break;
            case "telephone":
                list = dormitoryMapper.searchByTelephone(value);
                break;
        }
        return list;
    }
}
