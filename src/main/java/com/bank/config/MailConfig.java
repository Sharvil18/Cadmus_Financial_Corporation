package com.bank.config;

import jakarta.mail.Authenticator;
import jakarta.mail.Session;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;

public class MailConfig {

    @Bean
    public static JavaMailSenderImpl getMailConfig() {
        JavaMailSenderImpl emailConfig = new JavaMailSenderImpl();

        //Set Properties:
        Properties props = emailConfig.getJavaMailProperties();
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.port", "465");
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.ssl.enable", "true");

//        Session sess = Session.getDefaultInstance(props, new Authenticator() {
//            @Override
//            protected jakarta.mail.PasswordAuthentication getPasswordAuthentication() {
//                return new jakarta.mail.PasswordAuthentication("cadmus.finance.corp@gmail.com", "cghm ssum irce npjf");
//            }
//        });
//
//        sess.setDebug(true);

        emailConfig.setUsername("cadmus.finance.corp@gmail.com");
        emailConfig.setPassword("cghm ssum irce npjf");

        return emailConfig;
    }
    //End of Email Config Method
}
