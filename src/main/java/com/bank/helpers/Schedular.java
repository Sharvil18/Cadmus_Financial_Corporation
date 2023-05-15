package com.bank.helpers;

import com.bank.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.sql.Time;
import java.util.Date;

@Service
public class Schedular {

    @Autowired
    private EmployeeRepository employeeRepository;

    @Scheduled(fixedRate = 5000)
    public void test() {
        System.out.println("Schedular test. Time: " + new Date().toString());
    }
}
