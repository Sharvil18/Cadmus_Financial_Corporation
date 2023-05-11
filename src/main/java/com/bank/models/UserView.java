package com.bank.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.time.LocalDateTime;

@Entity
@Table(name = "v_users")
public class UserView {
    @Id
    private int user_id;
    private String name;
    private String email;
    private int account_count;
    private LocalDateTime created_at;
    private LocalDateTime verified_at;
    private LocalDateTime updated_at;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getAccount_count() {
        return account_count;
    }

    public void setAccount_count(int account_count) {
        this.account_count = account_count;
    }

    public LocalDateTime getCreated_at() {
        return created_at;
    }

    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }

    public LocalDateTime getVerified_at() {
        return verified_at;
    }

    public void setVerified_at(LocalDateTime verified_at) {
        this.verified_at = verified_at;
    }

    public LocalDateTime getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(LocalDateTime updated_at) {
        this.updated_at = updated_at;
    }
}
