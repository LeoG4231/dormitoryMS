package com.dormitory.service.impl;

import com.dormitory.entity.DormitoryAdmin;
import com.dormitory.mapper.DormitoryAdminMapper;
import com.dormitory.service.DormitoryAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DormitoryAdminServiceImpl implements DormitoryAdminService {

    @Autowired
    private DormitoryAdminMapper dormitoryAdminMapper;

    @Override
    public List<DormitoryAdmin> list() {
        return dormitoryAdminMapper.list();
    }

    @Override
    public List<DormitoryAdmin> search(String key, String value) {
        if(key.equals("")) return dormitoryAdminMapper.list();
        List<DormitoryAdmin> list = null;
        switch (key){
            case "username":
                list = dormitoryAdminMapper.searchByUsername(value);
                break;
            case "name":
                list = dormitoryAdminMapper.searchByName(value);
                break;
            case "telephone":
                list = dormitoryAdminMapper.searchByTelephone(value);
                break;
        }
        return list;
    }

    @Override
    public void save(DormitoryAdmin dormitoryAdmin) {
        try {
            dormitoryAdminMapper.save(dormitoryAdmin);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void del(int id) {
        try {
            dormitoryAdminMapper.del(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(DormitoryAdmin dormitoryAdmin) {
        try {
            dormitoryAdminMapper.update(dormitoryAdmin);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
