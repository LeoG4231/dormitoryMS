package com.dormitory.service;

import com.dormitory.entity.Student;

import java.util.List;

public interface StudentService {
    public List<Student> list();
    public List<Student> search(String key,String value);
    public void save(Student student);
    public void del(Integer id);
    public void update(Student student);
    public List<Student> moveList();
    public void move(Integer studentId,Integer dormitoryId,String reason);
    public List<Student> moveSearch(String key, String value);
}
