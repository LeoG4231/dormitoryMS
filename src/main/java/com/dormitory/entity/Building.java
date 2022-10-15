package com.dormitory.entity;

import lombok.Data;

@Data
public class Building {
    private Integer id;
    private String name;
    private String introduction;
    private String adminName;
    private Integer adminId;
}
