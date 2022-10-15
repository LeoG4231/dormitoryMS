package com.dormitory.controller;

import com.dormitory.entity.Student;
import com.dormitory.service.DormitoryService;
import com.dormitory.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;
    @Autowired
    private DormitoryService dormitoryService;

    @GetMapping("/list")
    public ModelAndView list(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/jsp/studentManager");
        modelAndView.addObject("list",studentService.list());
        modelAndView.addObject("dormitorys",dormitoryService.list());
        return modelAndView;
    }

    @PostMapping("/search")
    public ModelAndView search(String key,String value){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/jsp/studentManager");
        modelAndView.addObject("list",studentService.search(key,value));
        return modelAndView;
    }

    @PostMapping("/save")
    public String save(Student student){
        studentService.save(student);
        return "redirect:/student/list";
    }

    @PostMapping("/del")
    public String del(Integer id){
        studentService.del(id);
        return "redirect:/student/list";
    }

    @PostMapping("/update")
    public String update(Student student){
        studentService.update(student);
        return "redirect:/student/list";
    }
}
