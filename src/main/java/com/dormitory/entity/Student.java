package com.dormitory.entity;

import lombok.Data;

@Data
public class Student {
    private Integer id;
    private String number;
    private String name;
    private String gender;
    private Integer dormitoryId;
    private String dormitoryName;
    private String state;
    private String createDate;
}
