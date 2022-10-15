package com.dormitory.entity;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class LackSleep {
    private Integer id;
    private Integer buildingId;
    private String buildingName;
    private Integer dormitoryId;
    private String dormitoryName;
    private Integer studentId;
    private String studentName;
    private String reason;
    private Timestamp createDate;
}
