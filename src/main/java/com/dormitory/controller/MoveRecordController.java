package com.dormitory.controller;

import com.dormitory.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/moveRecord")
public class MoveRecordController {

    @Autowired
    private RecordService recordService;

    @GetMapping("/list")
    public ModelAndView list(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("jsp/moveRecord");
        modelAndView.addObject("list",recordService.list());
        return modelAndView;
    }

    @PostMapping("/search")
    public ModelAndView search(String key,String value){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("jsp/moveRecord");
        modelAndView.addObject("list",recordService.search(key, value));
        return modelAndView;
    }
}
