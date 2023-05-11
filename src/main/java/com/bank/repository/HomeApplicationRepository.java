package com.bank.repository;

import com.bank.models.HomeLoanApplication;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.w3c.dom.stylesheets.LinkStyle;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface HomeApplicationRepository extends CrudRepository<HomeLoanApplication, Integer> {

    @Query(value= "SELECT user_id FROM home_loan_application", nativeQuery = true)
    List<Integer> getAllUsersAppliedHomeLoan();

    @Query(value= "SELECT * FROM home_loan_application", nativeQuery = true)
    List<HomeLoanApplication> getAllHomeLoanApplications();

    @Modifying
    @Transactional
    @Query(value = "INSERT INTO home_loan_application(user_id, application_number, first_name, last_name, email, contact, religion, age, birth_date, marital_status, proof_of_identity, address_house, address_complex, address_street_line1, address_street_line2, " +
            "address_city, address_state, address_postal_code, address_proof, company_name, job_title, employment_status, employment_period, work_mode, department, salary, industry, salary_slip, income, investment, credit_card_debt, account, " +
            "bank_account_statement, purchase_price, loan_amount_requested, down_payment_amount, current_home, sell_current, motto_purchase) VALUES " +
            "(:user_id, :application_number, :first_name, :last_name, :email, :contact, :religion, :age, :birth_date, :marital_status, :proof_of_identity, :address_house, :address_complex, :address_street_line1, :address_street_line2, :address_city, " +
            ":address_state, :address_postal_code, :address_proof, :company_name, :job_title, :employment_status, :employment_period, :work_mode, :department, :salary, :industry, :salary_slip, :income, :investment, :credit_card_debt, " +
            ":account, :bank_account_statement, :purchase_price, :loan_amount_requested, :down_payment_amount, :current_home, :sell_current, :motto_purchase)", nativeQuery = true)
    void applyHomeLoan(@Param("user_id") int user_id,
                       @Param("application_number") String application_number,
                       @Param("first_name") String first_name,
                       @Param("last_name") String last_name,
                       @Param("email") String email,
                       @Param("contact") String contact,
                       @Param("religion") String religion,
                       @Param("age") int age,
                       @Param("birth_date") LocalDate birth_date,
                       @Param("marital_status") String marital_status,
                       @Param("proof_of_identity") byte[] proof_of_identity,
                       @Param("address_house") String address_house,
                       @Param("address_complex") String address_complex,
                       @Param("address_street_line1") String address_street_line1,
                       @Param("address_street_line2") String address_street_line2,
                       @Param("address_city") String address_city,
                       @Param("address_state") String address_state,
                       @Param("address_postal_code") String address_postal_code,
                       @Param("address_proof") byte[] address_proof,
                       @Param("company_name") String company_name,
                       @Param("job_title") String job_title,
                       @Param("employment_status") String employment_status,
                       @Param("employment_period") int employment_period,
                       @Param("work_mode") String work_mode,
                       @Param("department") String department,
                       @Param("salary") double salary,
                       @Param("industry") String industry,
                       @Param("salary_slip") byte[] salary_slip,
                       @Param("income") double income,
                       @Param("investment") double investment,
                       @Param("credit_card_debt") double credit_card_debt,
                       @Param("account") int account,
                       @Param("bank_account_statement") byte[] bank_account_statement,
                       @Param("purchase_price") double purchase_price,
                       @Param("loan_amount_requested") double loan_amount_requested,
                       @Param("down_payment_amount") double down_payment_amount,
                       @Param("current_home") String current_home,
                       @Param("sell_current") String sell_current,
                       @Param("motto_purchase") String motto_purchase);
}
