package com.dormitory.mapper;

import com.dormitory.entity.SystemAdmin;

public interface SystemAdminMapper {
    public SystemAdmin findByUsername(String username);
}
