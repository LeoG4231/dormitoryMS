package com.dormitory.controller;

import com.dormitory.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/move")
public class MoveController {

    @Autowired
    private StudentService studentService;

    @GetMapping("/list")
    public ModelAndView list(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("jsp/moveRegister");
        modelAndView.addObject("list",studentService.moveList());
        return modelAndView;
    }

    @PostMapping("/moveOut")
    public String moveOut(Integer studentId,Integer dormitoryId,String reason){
        studentService.move(studentId,dormitoryId,reason);
        return "redirect:/move/list";
    }

    @PostMapping("/search")
    public ModelAndView search(String key,String value){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("jsp/moveRegister");
        modelAndView.addObject("list",studentService.moveSearch(key,value));
        return modelAndView;
    }
}
