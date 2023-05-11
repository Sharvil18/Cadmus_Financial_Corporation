package com.bank.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

import java.time.LocalDateTime;

@Entity
public class Admin {
    @Id
    private String admin_id;
    private String admin_email;
    private String admin_first_name;
    private String admin_last_name;
    private String admin_password;
    private LocalDateTime admin_last_login;

    public String getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(String admin_id) {
        this.admin_id = admin_id;
    }

    public String getAdmin_email() {
        return admin_email;
    }

    public void setAdmin_email(String admin_email) {
        this.admin_email = admin_email;
    }

    public String getAdmin_first_name() {
        return admin_first_name;
    }

    public void setAdmin_first_name(String admin_first_name) {
        this.admin_first_name = admin_first_name;
    }

    public String getAdmin_last_name() {
        return admin_last_name;
    }

    public void setAdmin_last_name(String admin_last_name) {
        this.admin_last_name = admin_last_name;
    }

    public String getAdmin_password() {
        return admin_password;
    }

    public void setAdmin_password(String admin_password) {
        this.admin_password = admin_password;
    }

    public LocalDateTime getAdmin_last_login() {
        return admin_last_login;
    }

    public void setAdmin_last_login(LocalDateTime admin_last_login) {
        this.admin_last_login = admin_last_login;
    }
}
