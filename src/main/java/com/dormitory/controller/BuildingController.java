package com.dormitory.controller;

import com.dormitory.entity.Building;
import com.dormitory.service.BuildingService;
import com.dormitory.service.DormitoryAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/building")
public class BuildingController {

    @Autowired
    private BuildingService buildingService;
    @Autowired
    private DormitoryAdminService dormitoryAdminService;

    @GetMapping("/list")
    public ModelAndView list(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("jsp/buildingManager");
        modelAndView.addObject("list",buildingService.list());
        modelAndView.addObject("dormitoryAdmins",dormitoryAdminService.list());
        return modelAndView;
    }

    @PostMapping("/search")
    public ModelAndView search(String key,String value){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("jsp/buildingManager");
        modelAndView.addObject("list",buildingService.search(key,value));
        return modelAndView;
    }

    @PostMapping("/save")
    public String save(Building building){
        buildingService.save(building);
        return "redirect:/building/list";
    }

    @PostMapping("/update")
    public String update(Building building){
        buildingService.update(building);
        return "redirect:/building/list";
    }

    @PostMapping("/delete")
    public String delete(Integer id){
        buildingService.delete(id);
        return "redirect:/building/list";
    }
}
