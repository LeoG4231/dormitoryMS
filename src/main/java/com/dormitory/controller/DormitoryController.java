package com.dormitory.controller;

import com.dormitory.entity.Dormitory;
import com.dormitory.service.BuildingService;
import com.dormitory.service.DormitoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/dormitory")
public class DormitoryController {

    @Autowired
    private DormitoryService dormitoryService;
    @Autowired
    private BuildingService buildingService;

    @GetMapping("/list")
    public ModelAndView list(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("jsp/dormitoryManager");
        modelAndView.addObject("list",dormitoryService.list());
        modelAndView.addObject("buildings",buildingService.list());
        return modelAndView;
    }

    @PostMapping("/save")
    public String save(Dormitory dormitory){
        dormitoryService.save(dormitory);
        return "redirect:/dormitory/list";
    }

    @PostMapping("/search")
    public ModelAndView search(String key,String value){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("jsp/dormitoryManager");
        modelAndView.addObject("list",dormitoryService.search(key, value));
        return modelAndView;
    }

    @PostMapping("/update")
    public String update(Dormitory dormitory){
        dormitoryService.update(dormitory);
        return "redirect:/dormitory/list";
    }

    @PostMapping("/delete")
    public String delete(Integer id){
        dormitoryService.del(id);
        return "redirect:/dormitory/list";
    }
}
