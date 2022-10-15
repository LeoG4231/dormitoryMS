package com.dormitory.entity;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class MoveRecord {
    private Integer id;
    private Integer studentId;
    private String studentName;
    private Integer dormitoryId;
    private String dormitoryName;
    private String reason;
    private Timestamp createDate;
}
