package com.bank.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Department {
    @Id
    private int department_id;
    private String department_name;
    private String department_head;
    private String department_description;

    private int department_head_id;

    public int getDepartment_id() {
        return department_id;
    }

    public void setDepartment_id(int department_id) {
        this.department_id = department_id;
    }

    public String getDepartment_name() {
        return department_name;
    }

    public void setDepartment_name(String department_name) {
        this.department_name = department_name;
    }

    public String getDepartment_head() {
        return department_head;
    }

    public void setDepartment_head(String department_head) {
        this.department_head = department_head;
    }

    public String getDepartment_description() {
        return department_description;
    }

    public void setDepartment_description(String department_description) {
        this.department_description = department_description;
    }

    public int getDepartment_head_id() {
        return department_head_id;
    }

    public void setDepartment_head_id(int department_head_id) {
        this.department_head_id = department_head_id;
    }
}
