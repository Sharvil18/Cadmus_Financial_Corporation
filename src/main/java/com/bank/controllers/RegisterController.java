package com.bank.controllers;

import com.bank.helpers.HTML;
import com.bank.helpers.Token;
import com.bank.mailMessenger.MailMessenger;
import com.bank.models.User;
import com.bank.repository.UserRepository;
import jakarta.mail.MessagingException;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Random;

@Controller
public class RegisterController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/register")
    public ModelAndView getRegister() {
        ModelAndView getRegisterPage = new ModelAndView(("register"));
        System.out.println("In register controller");
        getRegisterPage.addObject("PageTitle", "Register");
        return getRegisterPage;
    }

    @PostMapping("/register")
    public ModelAndView register(@Valid @ModelAttribute("registerUser") User user,
                                 BindingResult result,
                                 @RequestParam("first_name") String first_name,
                                 @RequestParam("last_name") String last_name,
                                 @RequestParam("email") String email,
                                 @RequestParam("password") String password,
                                 @RequestParam("confirm_password") String confirm_password) throws MessagingException {
        ModelAndView registrationPage = new ModelAndView("register");

        //Check for Errors
        if(result.hasErrors() && confirm_password.isEmpty()) {
            registrationPage.addObject("confirm_pass", "Please confirm your password");
            return registrationPage;
        }

        //Check for password match
        if(!password.equals(confirm_password)) {
            registrationPage.addObject("passwordMisMatch", "Passwords do not match");
            return registrationPage;
        }

        List<String> allEmails = userRepository.getAllEmails();
        if(allEmails.contains(email)) {
            registrationPage.addObject("EmailExists", "Email Address is already registered. Please head to the log in section.");
            return registrationPage;
        }

        //Get token string
        String token = Token.generateToken();

        //Generate random code
        Random rand = new Random();
        int bound = 123;
        int code = bound * rand.nextInt(bound);

        //Get email HTML body
        String emailBody = HTML.htmlEmailTemplate(token, code);

        //Hash password
        String hashed_password = BCrypt.hashpw(password, BCrypt.gensalt());

        //Register user
        userRepository.registerUser(first_name, last_name, email, hashed_password, token, code);

        //Send email notification
        MailMessenger.htmlEmailMessenger("cadmus.finance.corp@gmail.com", email, "Account Verification for Cadmus Financial Corporation", emailBody);

        //Return to register page
        String successMessage = "Account Registered Successfully. Please check your email and verify your account!";
        registrationPage.addObject("success", successMessage);

        return registrationPage;
    }
}
