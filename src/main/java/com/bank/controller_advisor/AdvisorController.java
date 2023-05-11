package com.bank.controller_advisor;

import com.bank.models.Admin;
import com.bank.models.User;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class AdvisorController {
    @ModelAttribute("registerUser")
    public User getUserDefaults() {
        return new User();
    }
}


