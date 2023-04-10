package com.bank.mailMessenger;

import com.bank.config.MailConfig;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailMessenger {
    public static void htmlEmailMessenger(String from, String toMail, String subject, String body) {
        //Get email config:
        JavaMailSender sender = MailConfig.getMailConfig();
        //Set mime message
        MimeMessage message = sender.createMimeMessage();
        try {
            //Set mime message helper
            MimeMessageHelper htmlMessage = new MimeMessageHelper(message, true);
            //Set mail attributes/properties
            htmlMessage.setTo(toMail);
            htmlMessage.setFrom(from);
            htmlMessage.setSubject(subject);
            htmlMessage.setText(body, true);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        //Send message
        sender.send(message);
    }
}
