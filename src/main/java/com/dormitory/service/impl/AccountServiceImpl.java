package com.dormitory.service.impl;

import com.dormitory.dto.AccountDto;
import com.dormitory.entity.DormitoryAdmin;
import com.dormitory.entity.SystemAdmin;
import com.dormitory.form.AccountForm;
import com.dormitory.mapper.DormitoryAdminMapper;
import com.dormitory.mapper.SystemAdminMapper;
import com.dormitory.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountServiceImpl implements AccountService {

    @Autowired
    private SystemAdminMapper systemAdminMapper;
    @Autowired
    private DormitoryAdminMapper dormitoryAdminMapper;

    @Override
    public AccountDto login(AccountForm accountForm) {
        AccountDto dto = new AccountDto<>();
        //判断用户类型
        switch (accountForm.getType()){
            case "systemAdmin":
                SystemAdmin systemAdmin = systemAdminMapper.findByUsername(accountForm.getUsername());
                //判断用户名是否正确
                if (systemAdmin == null){
                    dto.setCode(-1);
                }else {
                    //判断密码是否正确
                    if(!systemAdmin.getPassword().equals(accountForm.getPassword())){
                        dto.setCode(-2);
                    }else {
                        dto.setCode(0);
                        dto.setAdmin(systemAdmin);
                    }
                }
                break;
            case "dormitoryAdmin":
                DormitoryAdmin dormitoryAdmin = dormitoryAdminMapper.findByUsername(accountForm.getUsername());
                //判断用户名是否正确
                if (dormitoryAdmin == null){
                    dto.setCode(-1);
                }else {
                    //判断密码是否正确
                    if(!dormitoryAdmin.getPassword().equals(accountForm.getPassword())){
                        dto.setCode(-2);
                    }else {
                        dto.setCode(0);
                        dto.setAdmin(dormitoryAdmin);
                    }
                }
                break;
        }
        return dto;
    }
}
