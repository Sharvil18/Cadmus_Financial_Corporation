package com.bank.repository;

import com.bank.models.LoanLog;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface LoanLogRepository extends CrudRepository<LoanLog, String> {

    @Modifying
    @Transactional
    @Query(value = "INSERT INTO loan_log(loan_application_number, loan_type, borrower_name, borrower_user_id, borrower_email, final_loan_amount, final_interest_rate, final_tenure, final_emi, total_amount_payable, total_interest_payable, " +
            "charges_payable, late_payment_penalty, pre_payment_penalty) " +
            "VALUES(:loan_application_number, :loan_type, :borrower_name, :borrower_user_id, :borrower_email, :final_loan_amount, :final_interest_rate, :final_tenure, :final_emi, :total_amount_payable, :total_interest_payable, " +
            ":charges_payable, :late_payment_penalty, :pre_payment_penalty)", nativeQuery = true)
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
                 @Param("pre_payment_penalty") double pre_payment_penalty);

}
