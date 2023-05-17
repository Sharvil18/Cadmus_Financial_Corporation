package com.bank.repository;

import com.bank.models.LoanLog;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface LoanLogRepository extends CrudRepository<LoanLog, String> {

    @Query(value = "SELECT * FROM loan_log", nativeQuery = true)
    List<LoanLog> getAllLoanLogs();

    @Query(value = "SELECT * FROM loan_log WHERE loan_application_number=:loan_application_number", nativeQuery = true)
    LoanLog getLoanLogsByApplicationNumber(@Param("loan_application_number") String loan_application_number);

    @Modifying
    @Transactional
    @Query(value = "UPDATE loan_log SET total_amount_payable=:total_amount_payable WHERE loan_application_number=:loan_application_number", nativeQuery = true)
    void updateAmountPayableByApplicationNumber(@Param("total_amount_payable") double total_amount_payable, @Param("loan_application_number") String loan_application_number);

    @Modifying
    @Transactional
    @Query(value = "UPDATE loan_log SET charges_payable=0 WHERE loan_application_number=:loan_application_number", nativeQuery = true)
    void updateChargesPayableByApplicationNumber(@Param("loan_application_number") String loan_application_number);

    @Modifying
    @Transactional
    @Query(value = "UPDATE loan_log SET total_penalty_payable=:total_penalty_payable WHERE loan_application_number=:loan_application_number", nativeQuery = true)
    void setPenaltyPayableByApplicationNumber(@Param("total_penalty_payable") double total_penalty_payable, @Param("loan_application_number") String loan_application_number);

    @Modifying
    @Transactional
    @Query(value = "UPDATE loan_log SET updated_at=:updated_at WHERE loan_application_number=:loan_application_number", nativeQuery = true)
    void logUpdateTimeByApplicationNumber(@Param("updated_at") LocalDateTime updated_at, @Param("loan_application_number") String loan_application_number);

    @Modifying
    @Transactional
    @Query(value = "UPDATE loan_log SET is_confirmed='yes' WHERE loan_application_number=:loan_application_number", nativeQuery = true)
    void setConfirmedToYesByApplicationNumber(@Param("loan_application_number") String loan_application_number);

    @Modifying
    @Transactional
    @Query(value = "INSERT INTO loan_log(loan_application_number, loan_type, borrower_name, borrower_user_id, borrower_email, final_loan_amount, final_interest_rate, final_tenure, final_emi, total_amount_payable, total_interest_payable, " +
            "charges_payable, late_payment_penalty, pre_payment_penalty, created_at, updated_at, borrower_account_id, is_confirmed) " +
            "VALUES(:loan_application_number, :loan_type, :borrower_name, :borrower_user_id, :borrower_email, :final_loan_amount, :final_interest_rate, :final_tenure, :final_emi, :total_amount_payable, :total_interest_payable, " +
            ":charges_payable, :late_payment_penalty, :pre_payment_penalty, NOW(), NOW(), :borrower_account_id, :is_confirmed)", nativeQuery = true)
    void logLoan(@Param("loan_application_number") String loan_application_number,
                 @Param("loan_type") String loan_type,
                 @Param("borrower_name") String borrower_name,
                 @Param("borrower_user_id") int borrower_user_id,
                 @Param("borrower_email") String borrower_email,
                 @Param("final_loan_amount") double final_loan_amount,
                 @Param("final_interest_rate") double final_interest_rate,
                 @Param("final_tenure") int final_tenure,
                 @Param("final_emi") double final_emi,
                 @Param("total_amount_payable") double total_amount_payable,
                 @Param("total_interest_payable") double total_interest_payable,
                 @Param("charges_payable") double charges_payable,
                 @Param("late_payment_penalty") double late_payment_penalty,
                 @Param("pre_payment_penalty") double pre_payment_penalty,
                 @Param("borrower_account_id") int borrower_account_id,
                @Param("is_confirmed") String is_confirmed);

}
