package com.bank.controllers;

import com.bank.helpers.GenerateAccountNumber;
import com.bank.models.User;
import com.bank.repository.GoldLoanApplicationRepository;
import com.bank.repository.HomeApplicationRepository;
import com.bank.repository.PersonalLoanApplicationRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/apply")
public class LoanController {

    @Autowired
    private HomeApplicationRepository homeApplicationRepository;

    @Autowired
    private PersonalLoanApplicationRepository personalLoanApplicationRepository;

    @Autowired
    private GoldLoanApplicationRepository goldLoanApplicationRepository;
    User user;

    @PostMapping("/home_loan")
    public String applyHomeLoan(@RequestParam("HL_UserFirstName") String userFirstName,
                                @RequestParam("HL_UserLastName") String userLastName,
                                @RequestParam("HL_UserEmail") String userEmail,
                                @RequestParam("HL_UserContact") String userContact,
                                @RequestParam("HL_UserReligion") String userReligion,
                                @RequestParam("HL_UserAge") String  userAge,
                                @RequestParam("HL_UserBirthDate") String userBirthDate,
                                @RequestParam("HL_UserMaritalStatus") String userMaritalStatus,
                                @RequestParam("HL_UserProofIdentity") MultipartFile userProofIdentity,

                                @RequestParam("HL_UserAddressHouse") String userAddressHouse,
                                @RequestParam("HL_UserAddressComplex") String userAddressComplex,
                                @RequestParam("HL_UserAddressStreetLine1") String userAddressStreetLine1,
                                @RequestParam("HL_UserAddressStreetLine2") String userAddressStreetLine2,
                                @RequestParam("HL_UserAddressCity") String userAddressCity,
                                @RequestParam("HL_userAddressState") String userAddressState,
                                @RequestParam("HL_UserAddressPostalCode") String userAddressPostalCode,
                                @RequestParam("HL_UserAddressProof") MultipartFile userAddressProof,

                                @RequestParam("HL_UserCompanyName") String userCompanyName,
                                @RequestParam("HL_UserJobTitle") String userJobTitle,
                                @RequestParam("HL_UserEmploymentStatus") String userEmploymentStatus,
                                @RequestParam("HLEmploymentPeriod") String userEmploymentPeriod,
                                @RequestParam("HL_UserWorkMode") String userWorkMode,
                                @RequestParam("HL_UserDepartment") String userDepartment,
                                @RequestParam("HL_UserSalary") String userSalary,
                                @RequestParam("HL_UserIndustry") String userIndustry,
                                @RequestParam("HL_UserSalarySlip") MultipartFile userSalarySlip,

                                @RequestParam("HL_UserIncome") String userIncome,
                                @RequestParam("HL_UserInvestment") String userInvestment,
                                @RequestParam("HL_UserCreditCardDebt") String userCreditCardDebt,
                                @RequestParam("HL_UserAccount") String userAccount,
                                @RequestParam("HL_UserBankAccountStatement") MultipartFile userBankAccountStatement,

                                @RequestParam("HL_UserPurchasePrice") String userPurchasePrice,
                                @RequestParam("HL_UserLoanAmountRequested") String userLoanAmountRequested,
                                @RequestParam("HL_UserDownPaymentAmount_hidden") String userDownPaymentAmount,
                                @RequestParam("HL_UserCurrentHome") String userCurrentHome,
                                @RequestParam("HL_UserSellCurrent") String userSellCurrent,
                                @RequestParam("HL_UserMottoPurchase") String userMottoPurchase,

                                HttpSession session,
                                RedirectAttributes redirectAttributes) throws IOException {

        //Get logged in user
        user = (User) session.getAttribute("user");
        int userId = user.getUser_id();

        List<Integer> usersApplied = homeApplicationRepository.getAllUsersAppliedHomeLoan();
        if(usersApplied.contains(userId)) {
            redirectAttributes.addFlashAttribute("error", "You have already applied for Home Loan");
            return "redirect:/app/loan";
        }

        //Converting variables
        int userAgeInt = Integer.parseInt(userAge);

        LocalDate userBirthDateLocalDate = LocalDate.parse(userBirthDate);

        int userEmploymentPeriodInt = Integer.parseInt(userEmploymentPeriod);
        double userSalaryDouble = Double.parseDouble(userSalary);

        double userIncomeDouble = Double.parseDouble(userIncome);
        double userInvestmentDouble = Double.parseDouble(userInvestment);
        double userCreditCardDebtDouble = Double.parseDouble(userCreditCardDebt);
        int userAccountInt = Integer.parseInt(userAccount);

        double userPurchasePriceBigDecimal =  Double.parseDouble(userPurchasePrice);
        double userLoanAmountRequestedBigDecimal = Double.parseDouble(userLoanAmountRequested);
        double userDownPaymentAmountBigDecimal = Double.parseDouble(userDownPaymentAmount);

        //Generate application number
        String applicationNumber = GenerateAccountNumber.generateApplicationNumber();

        //Converting PDF files into byte arrays
        byte[] userProofIdentityByteArray = userProofIdentity.getBytes();
        byte[] userAddressProofByteArray = userAddressProof.getBytes();
        byte[] userSalarySlipByteArray = userSalarySlip.getBytes();
        byte[] userBankAccountStatementByteArray = userBankAccountStatement.getBytes();

        homeApplicationRepository.applyHomeLoan(userId, applicationNumber, userFirstName, userLastName, userEmail, userContact, userReligion, userAgeInt, userBirthDateLocalDate, userMaritalStatus, userProofIdentityByteArray,
                userAddressHouse, userAddressComplex, userAddressStreetLine1, userAddressStreetLine2, userAddressCity, userAddressState, userAddressPostalCode, userAddressProofByteArray,
                userCompanyName, userJobTitle, userEmploymentStatus, userEmploymentPeriodInt, userWorkMode, userDepartment, userSalaryDouble, userIndustry, userSalarySlipByteArray,
                userIncomeDouble, userInvestmentDouble, userCreditCardDebtDouble, userAccountInt, userBankAccountStatementByteArray,
                userPurchasePriceBigDecimal, userLoanAmountRequestedBigDecimal, userDownPaymentAmountBigDecimal, userCurrentHome, userSellCurrent, userMottoPurchase);

        redirectAttributes.addFlashAttribute("success", "Successfully Applied for Home Loan!");

        return "redirect:/app/loan";
    }

    @PostMapping("/personal_loan")
    public String applyPersonalLoan(@RequestParam("PL_UserFirstName") String userFirstName,
                                @RequestParam("PL_UserLastName") String userLastName,
                                @RequestParam("PL_UserEmail") String userEmail,
                                @RequestParam("PL_UserContact") String userContact,
                                @RequestParam("PL_UserReligion") String userReligion,
                                @RequestParam("PL_UserAge") String  userAge,
                                @RequestParam("PL_UserBirthDate") String userBirthDate,
                                @RequestParam("PL_UserMaritalStatus") String userMaritalStatus,
                                @RequestParam("PL_UserProofIdentity") MultipartFile userProofIdentity,

                                @RequestParam("PL_UserAddressHouse") String userAddressHouse,
                                @RequestParam("PL_UserAddressComplex") String userAddressComplex,
                                @RequestParam("PL_UserAddressStreetLine1") String userAddressStreetLine1,
                                @RequestParam("PL_UserAddressStreetLine2") String userAddressStreetLine2,
                                @RequestParam("PL_UserAddressCity") String userAddressCity,
                                @RequestParam("PL_userAddressState") String userAddressState,
                                @RequestParam("PL_UserAddressPostalCode") String userAddressPostalCode,
                                @RequestParam("PL_UserAddressProof") MultipartFile userAddressProof,

                                @RequestParam("PL_UserCompanyName") String userCompanyName,
                                @RequestParam("PL_UserJobTitle") String userJobTitle,
                                @RequestParam("PL_UserEmploymentStatus") String userEmploymentStatus,
                                @RequestParam("PLEmploymentPeriod") String userEmploymentPeriod,
                                @RequestParam("PL_UserWorkMode") String userWorkMode,
                                @RequestParam("PL_UserDepartment") String userDepartment,
                                @RequestParam("PL_UserSalary") String userSalary,
                                @RequestParam("PL_UserIndustry") String userIndustry,
                                @RequestParam("PL_UserSalarySlip") MultipartFile userSalarySlip,

                                @RequestParam("PL_UserIncome") String userIncome,
                                @RequestParam("PL_UserInvestment") String userInvestment,
                                @RequestParam("PL_UserCreditCardDebt") String userCreditCardDebt,
                                @RequestParam("PL_UserAccount") String userAccount,
                                @RequestParam("PL_UserBankAccountStatement") MultipartFile userBankAccountStatement,

                                @RequestParam("PL_UserLoanAmountRequested") String userLoanAmountRequested,
                                @RequestParam("PL_UserLoanPurpose") String userLoanPurpose,
                                @RequestParam("PLloanTermSlider") String userLoanTerm,

                                HttpSession session,
                                RedirectAttributes redirectAttributes) throws IOException {

        //Get logged in user
        user = (User) session.getAttribute("user");
        int userId = user.getUser_id();

        List<Integer> usersApplied = personalLoanApplicationRepository.getAllUsersAppliedPersonalLoan();
        if(usersApplied.contains(userId)) {
            redirectAttributes.addFlashAttribute("error", "You have already applied for Personal Loan");
            return "redirect:/app/loan";
        }

        //Converting variables
        int userAgeInt = Integer.parseInt(userAge);

        LocalDate userBirthDateLocalDate = LocalDate.parse(userBirthDate);

        int userEmploymentPeriodInt = Integer.parseInt(userEmploymentPeriod);
        double userSalaryDouble = Double.parseDouble(userSalary);

        double userIncomeDouble = Double.parseDouble(userIncome);
        double userInvestmentDouble = Double.parseDouble(userInvestment);
        double userCreditCardDebtDouble = Double.parseDouble(userCreditCardDebt);
        int userAccountInt = Integer.parseInt(userAccount);

        double userLoanAmountRequestedDouble = Double.parseDouble(userLoanAmountRequested);
        int userLoanTermInt = Integer.parseInt(userLoanTerm);

        //Generate application number
        String applicationNumber = GenerateAccountNumber.generateApplicationNumber();

        //Converting PDF files into byte arrays
        byte[] userProofIdentityByteArray = userProofIdentity.getBytes();
        byte[] userAddressProofByteArray = userAddressProof.getBytes();
        byte[] userSalarySlipByteArray = userSalarySlip.getBytes();
        byte[] userBankAccountStatementByteArray = userBankAccountStatement.getBytes();

        personalLoanApplicationRepository.applyPersonalLoan(userId, applicationNumber, userFirstName, userLastName, userEmail, userContact, userReligion, userAgeInt, userBirthDateLocalDate, userMaritalStatus, userProofIdentityByteArray,
                userAddressHouse, userAddressComplex, userAddressStreetLine1, userAddressStreetLine2, userAddressCity, userAddressState, userAddressPostalCode, userAddressProofByteArray,
                userCompanyName, userJobTitle, userEmploymentStatus, userEmploymentPeriodInt, userWorkMode, userDepartment, userSalaryDouble, userIndustry, userSalarySlipByteArray,
                userIncomeDouble, userInvestmentDouble, userCreditCardDebtDouble, userAccountInt, userBankAccountStatementByteArray,
                userLoanAmountRequestedDouble, userLoanPurpose, userLoanTermInt);

        redirectAttributes.addFlashAttribute("success", "Successfully Applied for Personal Loan!");

        return "redirect:/app/loan";
    }

    @PostMapping("/gold_loan")
    public String applyGoldLoan(@RequestParam("GL_UserFirstName") String userFirstName,
                                    @RequestParam("GL_UserLastName") String userLastName,
                                    @RequestParam("GL_UserEmail") String userEmail,
                                    @RequestParam("GL_UserContact") String userContact,
                                    @RequestParam("GL_UserReligion") String userReligion,
                                    @RequestParam("GL_UserAge") String  userAge,
                                    @RequestParam("GL_UserBirthDate") String userBirthDate,
                                    @RequestParam("GL_UserMaritalStatus") String userMaritalStatus,
                                    @RequestParam("GL_UserProofIdentity") MultipartFile userProofIdentity,

                                    @RequestParam("GL_UserAddressHouse") String userAddressHouse,
                                    @RequestParam("GL_UserAddressComplex") String userAddressComplex,
                                    @RequestParam("GL_UserAddressStreetLine1") String userAddressStreetLine1,
                                    @RequestParam("GL_UserAddressStreetLine2") String userAddressStreetLine2,
                                    @RequestParam("GL_UserAddressCity") String userAddressCity,
                                    @RequestParam("GL_userAddressState") String userAddressState,
                                    @RequestParam("GL_UserAddressPostalCode") String userAddressPostalCode,
                                    @RequestParam("GL_UserAddressProof") MultipartFile userAddressProof,

                                    @RequestParam("GL_UserCompanyName") String userCompanyName,
                                    @RequestParam("GL_UserJobTitle") String userJobTitle,
                                    @RequestParam("GL_UserEmploymentStatus") String userEmploymentStatus,
                                    @RequestParam("GLEmploymentPeriod") String userEmploymentPeriod,
                                    @RequestParam("GL_UserWorkMode") String userWorkMode,
                                    @RequestParam("GL_UserDepartment") String userDepartment,
                                    @RequestParam("GL_UserSalary") String userSalary,
                                    @RequestParam("GL_UserIndustry") String userIndustry,
                                    @RequestParam("GL_UserSalarySlip") MultipartFile userSalarySlip,

                                    @RequestParam("GL_UserIncome") String userIncome,
                                    @RequestParam("GL_UserInvestment") String userInvestment,
                                    @RequestParam("GL_UserCreditCardDebt") String userCreditCardDebt,
                                    @RequestParam("GL_UserAccount") String userAccount,
                                    @RequestParam("GL_UserBankAccountStatement") MultipartFile userBankAccountStatement,

                                    @RequestParam("GL_UserLoanPurpose") String userLoanPurpose,
                                    @RequestParam("GLgoldWeightSlider") String userGoldWeight,
                                    @RequestParam("GL_UserGoldOrnaments") List<String> userGoldOrnaments,
                                    @RequestParam("GL_UserGoldOrnamentCount") String userGoldOrnamentCount,

                                    HttpSession session,
                                    RedirectAttributes redirectAttributes) throws IOException {

        //Get logged in user
        user = (User) session.getAttribute("user");
        int userId = user.getUser_id();

        List<Integer> usersApplied = goldLoanApplicationRepository.getAllUsersAppliedGoldLoan();
        if(usersApplied.contains(userId)) {
            redirectAttributes.addFlashAttribute("error", "You have already applied for Gold Loan");
            return "redirect:/app/loan";
        }

        //Converting variables
        int userAgeInt = Integer.parseInt(userAge);

        LocalDate userBirthDateLocalDate = LocalDate.parse(userBirthDate);

        int userEmploymentPeriodInt = Integer.parseInt(userEmploymentPeriod);
        double userSalaryDouble = Double.parseDouble(userSalary);

        double userIncomeDouble = Double.parseDouble(userIncome);
        double userInvestmentDouble = Double.parseDouble(userInvestment);
        double userCreditCardDebtDouble = Double.parseDouble(userCreditCardDebt);
        int userAccountInt = Integer.parseInt(userAccount);

        int userGoldWeightInt = Integer.parseInt(userGoldWeight);
        int userGoldOrnamentCountInt = Integer.parseInt(userGoldOrnamentCount);
        String userGoldOrnamentString = String.join(", ", userGoldOrnaments);

        //Generate application number
        String applicationNumber = GenerateAccountNumber.generateApplicationNumber();

        //Converting PDF files into byte arrays
        byte[] userProofIdentityByteArray = userProofIdentity.getBytes();
        byte[] userAddressProofByteArray = userAddressProof.getBytes();
        byte[] userSalarySlipByteArray = userSalarySlip.getBytes();
        byte[] userBankAccountStatementByteArray = userBankAccountStatement.getBytes();

        goldLoanApplicationRepository.applyGoldLoan(userId, applicationNumber, userFirstName, userLastName, userEmail, userContact, userReligion, userAgeInt, userBirthDateLocalDate, userMaritalStatus, userProofIdentityByteArray,
                userAddressHouse, userAddressComplex, userAddressStreetLine1, userAddressStreetLine2, userAddressCity, userAddressState, userAddressPostalCode, userAddressProofByteArray,
                userCompanyName, userJobTitle, userEmploymentStatus, userEmploymentPeriodInt, userWorkMode, userDepartment, userSalaryDouble, userIndustry, userSalarySlipByteArray,
                userIncomeDouble, userInvestmentDouble, userCreditCardDebtDouble, userAccountInt, userBankAccountStatementByteArray,
                userLoanPurpose, userGoldWeightInt, userGoldOrnamentString, userGoldOrnamentCountInt);

        redirectAttributes.addFlashAttribute("success", "Successfully Applied for Gold Loan!");

        return "redirect:/app/loan";
    }
}
