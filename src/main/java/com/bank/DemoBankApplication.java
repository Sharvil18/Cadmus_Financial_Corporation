package com.bank;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCrypt;

import java.util.ArrayList;
import java.util.List;

@SpringBootApplication
public class DemoBankApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoBankApplication.class, args);
	}

}
