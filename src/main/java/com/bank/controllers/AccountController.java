package com.bank.controllers;

import com.bank.helpers.GenerateAccountNumber;
import com.bank.models.User;
import com.bank.repository.AccountRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private AccountRepository accountRepository;

    @PostMapping("/create_account")
    public String createAccount(@RequestParam("account_name") String accountName,
                                @RequestParam("account_type") String accountType,
                                RedirectAttributes redirectAttributes,
                                HttpSession session) {
        //Check for empty strings
        if(accountName.isEmpty() || accountType.isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "Account Name or Account Type Cannot be Empty!");
            return "redirect:/app/dashboard";
        }
        //Get logged in user
        User user = (User) session.getAttribute("user");

        //Generate account number
        String bankAccountNumber = GenerateAccountNumber.generateAccountNumber();

        //Creating account
        accountRepository.createBankAccount(user.getUser_id(), bankAccountNumber, accountName, accountType);

        //Set success message
        redirectAttributes.addFlashAttribute("success", "Account Created Successfully!");
        return "redirect:/app/dashboard";
    }
}
