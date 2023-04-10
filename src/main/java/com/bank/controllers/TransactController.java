package com.bank.controllers;

import com.bank.models.User;
import com.bank.repository.AccountRepository;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/transact")
public class TransactController {

    @Autowired
    private AccountRepository accountRepository;

    User user;
    double accountBalance;
    double newBalance;

    @PostMapping("/deposit")
    public String deposit(@RequestParam("deposit_amount") String depositAmount,
                          @RequestParam("account_id") String accountID,
                          HttpSession session,
                          RedirectAttributes redirectAttributes) {

        //Check for empty strings
        if(depositAmount.isEmpty() || accountID.isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "Deposit Amount OR Depositing Account cannot be Empty");
            return "redirect:/app/dashboard";
        }

        //Get logged in user
        user = (User) session.getAttribute("user");

        //Get current account balance
        int account_id = Integer.parseInt(accountID);
        accountBalance = accountRepository.getAccountBalance(user.getUser_id(), account_id);

        //Check if deposit amount is 0
        double depositAmountValue = Double.parseDouble(depositAmount);
        if (depositAmountValue == 0) {
            redirectAttributes.addFlashAttribute("error", "Deposit Amount cannot be Zero (0)");
            return "redirect:/app/dashboard";
        }

        //Update balance
        newBalance = accountBalance + depositAmountValue;
        accountRepository.changeAccountBalanceById(newBalance, account_id);

        redirectAttributes.addFlashAttribute("success", "Amount Deposited Successfully!");
        return "redirect:/app/dashboard";
    }

    @PostMapping("/transfer")
    public String transfer(@RequestParam("transfer_from") String transfer_from,
                           @RequestParam("transfer_to") String transfer_to,
                           @RequestParam("transfer_amount") String transfer_amount,
                           HttpSession session,
                           RedirectAttributes redirectAttributes) {

        //Check for empty strings
        if(transfer_from.isEmpty() || transfer_to.isEmpty() || transfer_amount.isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "Transferring Account OR Transferred Account OR Transfer Amount cannot be Empty");
            return "redirect:/app/dashboard";
        }

        //Get logged in user
        user = (User) session.getAttribute("user");

        //Converting variables
        int transferFromId = Integer.parseInt(transfer_from);
        int transferToId = Integer.parseInt(transfer_to);
        double transferAmount = Double.parseDouble(transfer_amount);

        //Check if user transferring into the same account
        if(transferFromId == transferToId) {
            redirectAttributes.addFlashAttribute("error", "Cannot Transfer into the Same Account. Please Select an Appropriate Account for Transferring");
            return "redirect:/app/dashboard";
        }

        //Check if transfer amount is zero
        if (transferAmount == 0) {
            redirectAttributes.addFlashAttribute("error", "Transfer Amount cannot be Zero (0)");
            return "redirect:/app/dashboard";
        }

        //Get current account balance
        double accountBalanceOfAccountTransferringFrom = accountRepository.getAccountBalance(user.getUser_id(), transferFromId);
        double accountBalanceOfAccountTransferringTo = accountRepository.getAccountBalance(user.getUser_id(), transferToId);

        //Set new balance
        double newBalanceOfAccountTransferringFrom = accountBalanceOfAccountTransferringFrom - transferAmount;
        double newBalanceOfAccountTransferringTo = accountBalanceOfAccountTransferringTo + transferAmount;

        //Change balance of account transferring from
        accountRepository.changeAccountBalanceById(newBalanceOfAccountTransferringFrom, transferFromId);

        //Change balance of account transferring to
        accountRepository.changeAccountBalanceById(newBalanceOfAccountTransferringTo, transferToId);

        redirectAttributes.addFlashAttribute("success", "Amount Transferred Successfully!");
        return "redirect:/app/dashboard";
    }

    @PostMapping("/withdraw")
    public String withdraw(@RequestParam("account_id") String accountID,
                           @RequestParam("withdrawal_amount") String withdrawalAmount,
                           HttpSession session,
                           RedirectAttributes redirectAttributes) {
        //Check for empty strings
        if(withdrawalAmount.isEmpty() || accountID.isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "Withdrawal Account OR Withdrawal Amount cannot be Empty");
            return "redirect:/app/dashboard";
        }

        //Convert variables
        double withdrawalAmountValue = Double.parseDouble(withdrawalAmount);
        int account_id = Integer.parseInt(accountID);

        //Check for 0 values
        if(withdrawalAmountValue == 0) {
            redirectAttributes.addFlashAttribute("error", "Withdrawal Amount cannot be Zero (0)");
            return "redirect:/app/dashboard";
        }

        //Get logged in user
        user = (User) session.getAttribute("user");

        //Get current account balance
        accountBalance = accountRepository.getAccountBalance(user.getUser_id(), account_id);

        //Set new balance
        newBalance = accountBalance - withdrawalAmountValue;

        //Update account balance
        accountRepository.changeAccountBalanceById(newBalance, account_id);

        redirectAttributes.addFlashAttribute("success", "Amount Withdrawn Successfully!");
        return "redirect:/app/dashboard";
    }
}