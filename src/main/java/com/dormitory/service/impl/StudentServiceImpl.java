package com.dormitory.service.impl;

import com.dormitory.entity.Student;
import com.dormitory.mapper.DormitoryMapper;
import com.dormitory.mapper.StudentMapper;
import com.dormitory.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private DormitoryMapper dormitoryMapper;

    @Override
    public List<Student> list() {
        return studentMapper.list();
    }

    @Override
    public List<Student> search(String key, String value) {
        if(key.equals("")) return studentMapper.list();
        List<Student> list = null;
        switch (key){
            case "number":
                list = studentMapper.searchByNumber(value);
                break;
            case "name":
                list = studentMapper.searchByName(value);
                break;
        }
        return list;
    }

    @Override
    public void save(Student student) {
        try {
            studentMapper.save(student);
            System.out.println(student.getDormitoryId());
            dormitoryMapper.subAvailable(student.getDormitoryId());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void del(Integer id) {
        try {
            studentMapper.del(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Student student) {
        try {
            studentMapper.update(student);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Student> moveList() {
        return studentMapper.moveList();
    }

    @Override
    public void move(Integer studentId,Integer dormitoryId,String reason) {
        try {
            studentMapper.moveOutSave(studentId,dormitoryId,reason);
            studentMapper.move(studentId);
            dormitoryMapper.addAvailable(dormitoryId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Student> moveSearch(String key, String value) {
        if (key.equals("")) return null;
        List<Student> list = null;
        switch (key){
            case "dormitoryName":
                list = studentMapper.moveSearchByDormitoryName(value);
                break;
            case "name":
                list = studentMapper.moveSearchByName(value);
                break;
        }
        return list;
    }

}
