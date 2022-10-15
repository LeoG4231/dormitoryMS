package com.dormitory.service;

import com.dormitory.dto.AccountDto;
import com.dormitory.form.AccountForm;

public interface AccountService {
    public AccountDto login(AccountForm accountForm);
}
