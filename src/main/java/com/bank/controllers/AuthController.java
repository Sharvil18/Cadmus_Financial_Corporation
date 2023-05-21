package com.bank.controllers;

import com.bank.helpers.GenerateAccountNumber;
import com.bank.helpers.Token;
import com.bank.models.Admin;
import com.bank.models.User;
import com.bank.repository.AdminRepository;
import com.bank.repository.UserRepository;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AdminRepository adminRepository;

    @Value("${twilio.accountSid}")
    String accountSid;

    @Value("${twilio.phoneNumber}")
    String fromPhoneNumber;


    @Value("${twilio.authToken}")
    String authToken;


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
                        @RequestParam("contact") String contact,
                        @RequestParam("password") String password,
                        @RequestParam("_token") String token,
                        Model model,
                        HttpSession session) {
        //Validate input fields / form data
        if(email.isEmpty() || email == null || password.isEmpty() || password == null || contact.isEmpty() || contact == null) {
            model.addAttribute("error", "Username or Password or Contact cannot be empty");
            return "login";
        }

        //Check for valid email
        String regex = "([a-zA-Z0-9]+(?:[._+-][a-zA-Z0-9]+)*)@([a-zA-Z0-9]+(?:[.-][a-zA-Z0-9]+)*[.][a-zA-Z]{2,})";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(email);
        if(!matcher.matches()) {
            model.addAttribute("error", "Please enter a Valid Email Address");
            return "login";
        }

        //Check for valid Contact;
        String regexContact = "^\\d{10}$";
        Pattern patternContact = Pattern.compile(regexContact);
        Matcher matcherContact = patternContact.matcher(contact);
        if(!matcherContact.matches()) {
            model.addAttribute("error", "Please enter a valid Phone Number");
            return "login";
        }

        //Check if email exists
        List<String> allEmails = userRepository.getAllEmails();
        if(!allEmails.contains(email)) {
            model.addAttribute("error", "Your Account does not exist. Please Sign Up!");
            return "login";
        }

        //Check if contact matches
        String contactInDB = userRepository.getUserContact(email);
        if(!contact.equals(contactInDB)) {
            model.addAttribute("error", "Contact does not match with your Account. Please retry again");
            return "login";
        }

        //Get email from database
        String getEmailInDB = userRepository.getUserEmail(email);

        //Check password
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
        session.setAttribute("contact", contact);

        return "redirect:/otp";
    }

    @GetMapping("/otp")
    public ModelAndView RenderOtp(HttpSession session, RedirectAttributes redirectAttributes) {
        ModelAndView getOtpGateway = new ModelAndView("OtpGateway");
        String contact = (String) session.getAttribute("contact");
        session.removeAttribute("contact");
        getOtpGateway.addObject("contact", contact);

        //Generate message body
        String otp = GenerateAccountNumber.generateOTP();
        String messageBody = "Your One-Time Password (OTP) is: " + otp + " . Please enter this code to verify your login. Do not share it with anyone.";
        //Send OTP to contact
        Twilio.init(accountSid, authToken);
        Message message = Message.creator(new PhoneNumber("+91" + contact), new PhoneNumber(fromPhoneNumber), messageBody).create();
        System.out.println(message.getSid());

        session.setAttribute("OTP", otp);

        return getOtpGateway;
    }

    @PostMapping("/otpvalidate")
    public String validateOTP(@RequestParam("otp1") String otp1,
                              @RequestParam("otp2") String otp2,
                              @RequestParam("otp3") String otp3,
                              @RequestParam("otp4") String otp4,
                              @RequestParam("otp5") String otp5,
                              @RequestParam("otp6") String otp6,
                              HttpSession session,
                              Model model) {
        String inputOtp = otp1 + otp2 + otp3 + otp4 + otp5 + otp6;
        String generatedOtp = (String) session.getAttribute("OTP");
        if(!inputOtp.equals(generatedOtp)) {
            model.addAttribute("error", "OTP is invalid. Please try again.");
            return "login";
        }
        else {
            return "redirect:/app/dashboard";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
        session.invalidate();
        redirectAttributes.addFlashAttribute("logged_out", "Logged Out successfully");
        return "redirect:/login";
    }

    @GetMapping("/adminlogin")
    public ModelAndView getAdminLogin() {
        System.out.println("In admin login controller");
        ModelAndView getAdminLoginPage = new ModelAndView("adminlogin");
        return getAdminLoginPage;
    }

    @PostMapping("/adminlogin")
    public String loginAdmin(@RequestParam("admin_email") String adminEmail,
                             @RequestParam("admin_password") String adminPassword,
                             @RequestParam("admin_id") String adminID,
                             HttpSession session,
                             Model model) {

        if(adminEmail.isEmpty() || adminPassword.isEmpty() || adminID.isEmpty()) {
            model.addAttribute("error", "Email OR Password OR ID cannot be Empty");
            return "adminlogin";
        }

        //Check if admin ID exists
        List<String> allAdminID = adminRepository.getAllAdminID();
        if(!allAdminID.contains(adminID)) {
            model.addAttribute("error", "Admin with this ID does not exist");
            return "adminlogin";
        }

        //Check for valid email
        String regex = "([a-zA-Z0-9]+(?:[._+-][a-zA-Z0-9]+)*)@([a-zA-Z0-9]+(?:[.-][a-zA-Z0-9]+)*[.][a-zA-Z]{2,})";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(adminEmail);
        if(!matcher.matches()) {
            model.addAttribute("error", "Please enter a Valid Email Address");
            return "adminlogin";
        }

        //Check if email matches
        String adminEmailInDB = adminRepository.getAdminEmail(adminID);
        if(!adminEmail.equals(adminEmailInDB)) {
            model.addAttribute("error", "Incorrect Email Address OR Password");
            return "adminlogin";
        }

        //Check if password matches
        String adminPasswordInDB = adminRepository.getAdminPassword(adminID);
        if(!BCrypt.checkpw(adminPassword, adminPasswordInDB)) {
            model.addAttribute("error", "Incorrect Email Address or Password");
            return "adminlogin";
        }

        //Get admin details
        Admin admin = adminRepository.getAdminDetails(adminID);

        LocalDateTime currentTimeStamp = LocalDateTime.now();
        adminRepository.updateAdminLastLogin(currentTimeStamp, admin.getAdmin_id());

        //Set session attribute
        session.setAttribute("admin", admin);

        return "redirect:/app/admin_dashboard";
    }

    @GetMapping("/adminlogout")
    public String AdminLogout(HttpSession session, RedirectAttributes redirectAttributes) {
        session.invalidate();
        redirectAttributes.addFlashAttribute("logged_out", "Logged Out successfully");
        return "redirect:/adminlogin";
    }
}
