package com.dormitory.mapper;

import com.dormitory.entity.DormitoryAdmin;

import java.util.List;

public interface DormitoryAdminMapper {
    public List<DormitoryAdmin> list();
    public List<DormitoryAdmin> searchByUsername(String value);
    public List<DormitoryAdmin> searchByName(String value);
    public List<DormitoryAdmin> searchByTelephone(String value);
    public void save(DormitoryAdmin dormitoryAdmin);
    public void del(int id);
    public void update(DormitoryAdmin dormitoryAdmin);
    public DormitoryAdmin findByUsername(String value);
}
