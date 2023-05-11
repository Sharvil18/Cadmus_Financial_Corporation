package com.bank.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "v_users")
public class UserView {
    @Id
    private int user_id;
    private String name;
    private String email;
    private int account_count;

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
}
