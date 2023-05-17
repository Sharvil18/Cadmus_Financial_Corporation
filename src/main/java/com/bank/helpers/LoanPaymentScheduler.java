package com.bank.helpers;

import com.bank.mailMessenger.MailMessenger;
import com.bank.models.LoanLog;
import com.bank.repository.AccountRepository;
import com.bank.repository.LoanLogRepository;
import com.bank.repository.TransactRepository;
import com.bank.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;


@Service
public class LoanPaymentScheduler {

    @Autowired
    UserRepository userRepository;

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    LoanLogRepository loanLogRepository;

    @Autowired
    TransactRepository transactRepository;

    @Scheduled(cron = "0 0 0 1 * *")
    public void LoanPayment() {
        HashMap<String, Integer> months = new HashMap<>();
        for(LoanLog log : loanLogRepository.getAllLoanLogs()) {
            System.out.println("Inside scheduler");
            if(log.getTotal_amount_payable() > 0 && (log.getIs_confirmed().equals("yes"))) {
                System.out.println("Time: " + new Date().toString() + "\n" + log.getLoan_type() + " -- " + log.getLoan_application_number());
                LoanLog loanLog = loanLogRepository.getLoanLogsByApplicationNumber(log.getLoan_application_number());
                int borrowerAccountID = loanLog.getBorrower_account_id();
                int borrowerUserID = loanLog.getBorrower_user_id();
                double emi = loanLog.getFinal_emi();
                double charges = loanLog.getCharges_payable();
                double penalty = loanLog.getTotal_penalty_payable();
                double final_amount = emi + charges + penalty;
                double accountBalance = accountRepository.getAccountBalance(borrowerUserID, borrowerAccountID);
                if (accountBalance < final_amount) {
                    System.out.println("Insufficient Balance");
                    String email = loanLog.getBorrower_email();
                    String emailBody = HTML.insufficientBalance(loanLog.getBorrower_name(), loanLog.getLoan_type(), loanLog.getLoan_application_number(), loanLog.getLate_payment_penalty(),
                            loanLog.getTotal_amount_payable());
                    MailMessenger.htmlEmailMessenger("cadmus.finance.corp@gmail.com", email, loanLog.getLoan_type() + " Insufficient Balance Notice", emailBody, null);
                    //Log unsuccessful transaction
                    transactRepository.logTransaction(borrowerAccountID, loanLog.getLoan_type() + " Payment", final_amount, "Online", "Failure", "Insufficient Balance", LocalDateTime.now());
                    loanLogRepository.setPenaltyPayableByApplicationNumber(loanLog.getTotal_penalty_payable() + loanLog.getLate_payment_penalty(), loanLog.getLoan_application_number());
                }
                else {
                    double newAccountBalance = accountBalance - final_amount;
                    accountRepository.changeAccountBalanceById(newAccountBalance, borrowerAccountID);
                    loanLogRepository.updateAmountPayableByApplicationNumber(loanLog.getTotal_amount_payable() - final_amount, loanLog.getLoan_application_number());
                    loanLogRepository.updateChargesPayableByApplicationNumber(loanLog.getLoan_application_number());
                    loanLogRepository.setPenaltyPayableByApplicationNumber(0, loanLog.getLoan_application_number());
                    loanLogRepository.logUpdateTimeByApplicationNumber(LocalDateTime.now(), loanLog.getLoan_application_number());
                    //Log successful transaction
                    transactRepository.logTransaction(borrowerAccountID, loanLog.getLoan_type() + " Payment", final_amount, "Online", "Success", "Loan Payment Successful", LocalDateTime.now());
                    System.out.println("Successful loan payment");
                }
            }
        }
    }
}
