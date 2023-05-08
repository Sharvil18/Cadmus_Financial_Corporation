package com.bank.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDate;

@Entity
public class Employee {
    @Id
    private int employee_id;
    @NotNull
    private String first_name;
    @NotNull
    private String last_name;
    @NotNull
    private String email;
    @NotNull
    private String contact;
    @NotNull
    private String address;
    @NotNull
    private String city;
    @NotNull
    private String state;
    @NotNull
    private String postal_code;
    @NotNull
    private LocalDate hire_date;

}
