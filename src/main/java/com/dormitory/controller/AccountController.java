package com.dormitory.controller;

import com.dormitory.dto.AccountDto;
import com.dormitory.form.AccountForm;
import com.dormitory.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private AccountService accountService;

    @PostMapping("/login")
    public ModelAndView login(AccountForm accountForm, HttpSession session){
        AccountDto accountDto = accountService.login(accountForm);
        ModelAndView modelAndView = new ModelAndView();
        switch (accountDto.getCode()){
            case -1:
                modelAndView.setViewName("jsp/login");
                modelAndView.addObject("usernameError","用户名不存在");
                break;
            case -2:
                modelAndView.setViewName("jsp/login");
                modelAndView.addObject("passwordError","密码错误");
                break;
            case 0:
                switch (accountForm.getType()){
                    case "systemAdmin":
                        modelAndView.setViewName("jsp/systemAdmin");
                        session.setAttribute("systemAdmin",accountDto.getAdmin());
                        break;
                    case "dormitoryAdmin":
                        modelAndView.setViewName("jsp/dormitoryAdmin");
                        session.setAttribute("dormitoryAdmin",accountDto.getAdmin());
                        break;
                }
                break;
        }
        return modelAndView;
    }
}
