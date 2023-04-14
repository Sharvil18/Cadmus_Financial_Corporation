package com.bank.controllers;

import com.bank.helpers.PDFExporter;
import com.bank.helpers.PaymentHistoryPDFExporter;
import com.bank.helpers.TransactionHistoryPDFExporter;
import com.bank.models.Account;
import com.bank.models.PaymentHistory;
import com.bank.models.TransactionHistory;
import com.bank.models.User;
import com.bank.repository.AccountRepository;
import com.bank.repository.PaymentHistoryRepository;
import com.bank.repository.TransactHistoryRepository;
import com.lowagie.text.DocumentException;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/app")
public class AppController {

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private PaymentHistoryRepository paymentHistoryRepository;

    @Autowired
    private TransactHistoryRepository transactHistoryRepository;

    User user;

    @GetMapping("/dashboard")
    public ModelAndView getDashboard(HttpSession session, RedirectAttributes redirectAttributes) {
        //Set view
        ModelAndView getDashboardPage = new ModelAndView("dashboard");

        //Get the details of the logged in user
        user = (User) session.getAttribute("user");

        //Get the accounts of the logged in user
        List<Account> getUserAccounts = accountRepository.getUserAccountsById(user.getUser_id());

        //Get balance
        BigDecimal totalAccountBalance = accountRepository.getTotalBalance(user.getUser_id());



        //Set objects
        getDashboardPage.addObject("userAccounts", getUserAccounts);
        getDashboardPage.addObject("totalBalance", totalAccountBalance);

        return getDashboardPage;
    }

    @GetMapping("/payment_history")
    public ModelAndView getPaymentHistory(HttpSession session, HttpServletResponse response) throws DocumentException, IOException {
        //Set view
        ModelAndView getPaymentHistoryPage = new ModelAndView("paymentHistory");

        //Get logged in user
        user = (User) session.getAttribute("user");

        //Get payment record
        List<PaymentHistory> userPaymentHistory = paymentHistoryRepository.getPaymentRecordsById(user.getUser_id());

        //Set objects
        getPaymentHistoryPage.addObject("payment_history", userPaymentHistory);


        return getPaymentHistoryPage;
    }

    @GetMapping("/transact_history")
    public ModelAndView getTransactHistory(HttpSession session) {
        // Set View:
        ModelAndView getTransactHistoryPage = new ModelAndView("transactHistory");

        // Get Logged In User:\
        user = (User) session.getAttribute("user");

        // Get Payment History / Records:
        List<TransactionHistory> userTransactHistory = transactHistoryRepository.getTransactionRecordsById(user.getUser_id());

        getTransactHistoryPage.addObject("transact_history", userTransactHistory);

        return getTransactHistoryPage;
    }


    @GetMapping("/payment_history_export_pdf")
    public void exportPaymentHistoryToPDF(HttpServletResponse response, HttpSession session) throws DocumentException, IOException {
        //Prepare for exporting PDF
        response.setContentType("application/pdf");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
        String currentDateTime = dateFormatter.format(new Date());

        //Get logged in user
        user = (User) session.getAttribute("user");

        //Set header
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=" + user.getFirst_name() + " " + user.getLast_name() + "_payment_history_" + currentDateTime + ".pdf";
        response.setHeader(headerKey, headerValue);

        //Get payment record
        List<PaymentHistory> userPaymentHistoryList = paymentHistoryRepository.getPaymentRecordsById(user.getUser_id());

        //Export Payment history to PDF
        PaymentHistoryPDFExporter paymentHistoryPDFExporter = new PaymentHistoryPDFExporter(userPaymentHistoryList);
        paymentHistoryPDFExporter.export(response);
    }

    @GetMapping("/transaction_history_export_pdf")
    public void exportTransactionHistoryToPDF(HttpServletResponse response, HttpSession session) throws DocumentException, IOException {
        //Prepare for exporting PDF
        response.setContentType("application/pdf");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
        String currentDateTime = dateFormatter.format(new Date());

        //Get logged in user
        user = (User) session.getAttribute("user");

        //Set header
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=" + user.getFirst_name() + " " + user.getLast_name() + "_transaction_history_" + currentDateTime + ".pdf";
        response.setHeader(headerKey, headerValue);

        //Get transaction records
        List<TransactionHistory> transactionHistoryList = transactHistoryRepository.getTransactionRecordsById(user.getUser_id());

        //Export Transaction history to PDF
        TransactionHistoryPDFExporter transactionHistoryPDFExporter = new TransactionHistoryPDFExporter(transactionHistoryList);
        transactionHistoryPDFExporter.export(response);
    }

}
