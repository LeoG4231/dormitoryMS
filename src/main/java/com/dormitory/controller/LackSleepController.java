package com.dormitory.controller;

import com.dormitory.entity.LackSleep;
import com.dormitory.service.BuildingService;
import com.dormitory.service.DormitoryService;
import com.dormitory.service.LackSleepService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/lackSleep")
public class LackSleepController {

    @Autowired
    private LackSleepService lackSleepService;
    @Autowired
    private BuildingService buildingService;
    @Autowired
    private DormitoryService dormitoryService;

    @GetMapping("/list")
    public ModelAndView list(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("jsp/lackSleepRecord");
        modelAndView.addObject("list",lackSleepService.list());
        return modelAndView;
    }

    @GetMapping("/register")
    public ModelAndView register(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("jsp/lackSleepRegister");
        modelAndView.addObject("buildings",buildingService.list());
        modelAndView.addObject("dormitorys",dormitoryService.list());
        return modelAndView;
    }

    @PostMapping("/save")
    public String save(LackSleep lackSleep){
        lackSleepService.save(lackSleep);
        return "redirect:/lackSleep/list";
    }

    @PostMapping("/search")
    public ModelAndView search(String key,String value){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("jsp/lackSleepRecord");
        modelAndView.addObject("list",lackSleepService.search(key, value));
        return modelAndView;
    }
}
