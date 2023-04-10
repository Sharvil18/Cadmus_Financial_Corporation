package com.bank.controllers;

import com.bank.helpers.Token;
import com.bank.models.User;
import com.bank.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/login")
    public ModelAndView getLogin() {
        System.out.println("In login controller");
        ModelAndView getLoginPage = new ModelAndView(("login"));
        //Set token string
        String token = Token.generateToken();

        //Set token to view
        getLoginPage.addObject("token", token);
        getLoginPage.addObject("PageTitle", "Login");
        return getLoginPage;
    }

    @PostMapping("/login")
    public String login(@RequestParam("email") String email,
                        @RequestParam("password") String password,
                        @RequestParam("_token") String token,
                        Model model,
                        HttpSession session) {
        //Validate input fields / form data
        if(email.isEmpty() || email == null || password.isEmpty() || password == null) {
            model.addAttribute("error", "Username or Password cannot be empty");
            return "login";
        }
        //Get email from database
        String getEmailInDB = userRepository.getUserEmail(email);

        //Check if email exists
        if(getEmailInDB != null) {
            //Get password from database
            String getPasswordInDB = userRepository.getUserPassword(getEmailInDB);

            //Validate password
            if(!BCrypt.checkpw(password, getPasswordInDB)) {
                model.addAttribute("error", "Incorrect Username or Password");
                return "login";
            }

        }
        else {
            model.addAttribute("error", "Something went wrong. Please contact support");
            return "error";
        }

        //Get verified from database
        int verified = userRepository.isVerified(getEmailInDB);

        //Check if user account is verified
        if(verified != 1) {
            model.addAttribute("error", "This Account is not yet Verified. Please check email in order to verify account.");
            return "login";
        }

        //Proceed to log the user in
        User user = userRepository.getUserDetails(getEmailInDB);

        //Set session attribute
        session.setAttribute("user", user);
        session.setAttribute("token", token);
        session.setAttribute("authenticated", true);

        return "redirect:/app/dashboard";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
        session.invalidate();
        redirectAttributes.addFlashAttribute("logged_out", "Logged Out successfully");
        return "redirect:/login";
    }
}
