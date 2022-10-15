package com.dormitory.mapper;

import com.dormitory.entity.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentMapper {
    public List<Student> list();
    public List<Student> searchByNumber(String value);
    public List<Student> searchByName(String value);
    public void save(Student student);
    public void del(Integer id);
    public void update(Student student);
    public List<Student> moveList();
    public void move(Integer id);
    public List<Student> moveSearchByDormitoryName(String value);
    public List<Student> moveSearchByName(String value);
    public void moveOutSave(@Param("studentId") Integer studentId,@Param("dormitoryId")Integer dormitoryId,@Param("reason")String reason);
}
