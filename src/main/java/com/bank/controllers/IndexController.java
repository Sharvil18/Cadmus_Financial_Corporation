package com.bank.controllers;

import com.bank.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private HomeApplicationRepository homeApplicationRepository;

    @Autowired
    private PersonalLoanApplicationRepository personalLoanApplicationRepository;

    @Autowired
    private GoldLoanApplicationRepository goldLoanApplicationRepository;

    @Autowired
    private LoanLogRepository loanLogRepository;

    @GetMapping("/")
    public ModelAndView getIndex() {
        ModelAndView getIndexPage = new ModelAndView("index");
        getIndexPage.addObject("PageTitle", "Home");
        System.out.println("In index controller");
        return getIndexPage;
    }

    @GetMapping("/perk")
    public ModelAndView getPerk() {
        ModelAndView getPerkPage = new ModelAndView(("perk"));
        System.out.println("In perk controller");
        getPerkPage.addObject("PageTitle", "Perk");
        return getPerkPage;
    }

    @GetMapping("/aboutus")
    public ModelAndView getAboutus() {
        ModelAndView getAboutusPage = new ModelAndView(("aboutus"));
        System.out.println("In Aboutus controller");
        getAboutusPage.addObject("PageTitle", "Aboutus");
        return getAboutusPage;
    }



    @GetMapping("/error")
    public ModelAndView getError() {
        ModelAndView getErrorPage = new ModelAndView(("error"));
        System.out.println("In Error controller");
        getErrorPage.addObject("PageTitle", "Error");
        return getErrorPage;
    }

    @GetMapping("/verify")
    public ModelAndView getVerify(@RequestParam("token") String token,
                                  @RequestParam("code") String code) {
        //Set View
        ModelAndView getVerifyPage;

        //Get token in database
        String dbToken = userRepository.checkToken(token);

        //check if token is valid
        if(dbToken == null) {
            getVerifyPage = new ModelAndView("error");
            getVerifyPage.addObject("error", "This Session Has Expired");
            return getVerifyPage;
        }

        //Update verified_at
        userRepository.verifiedAtNow();

        //Update and verify account
        userRepository.verifyAccount(token, code);
        getVerifyPage = new ModelAndView("login");
        System.out.println("In Verify controller");
        getVerifyPage.addObject("success", "Account Verified Successfully, Please proceed to log in!");
        return getVerifyPage;
    }

    @GetMapping("/confirm")
    public ModelAndView confirmLoan(@RequestParam("loan_type") String loanType,
                            @RequestParam("application_number") String applicationNumber) {
        System.out.println("In Loan Confirmation Controller");

        ModelAndView getLoginPage = new ModelAndView("login");

        if(loanType.equals("Home")) {
            homeApplicationRepository.setConfirmToYesHomeLoanApplication(applicationNumber);
            loanLogRepository.setConfirmedToYesByApplicationNumber(applicationNumber);
        }

        else if(loanType.equals("Personal")) {
            personalLoanApplicationRepository.setConfirmToYesPersonalLoanApplication(applicationNumber);
            loanLogRepository.setConfirmedToYesByApplicationNumber(applicationNumber);
        }

        else if(loanType.equals("Gold")) {
            goldLoanApplicationRepository.setConfirmToYesGoldLoanApplication(applicationNumber);
            loanLogRepository.setConfirmedToYesByApplicationNumber(applicationNumber);
        }

        return getLoginPage;
    }

}
