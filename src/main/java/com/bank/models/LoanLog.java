package com.bank.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import org.springframework.cglib.core.Local;

import java.time.LocalDateTime;

@Entity
@Table(name = "loan_log")
public class LoanLog {
    @Id
    private String loan_application_number;
    private String loan_type;
    private String borrower_name;
    private int borrower_user_id;
    private String borrower_email;
    private double final_loan_amount;
    private double final_interest_rate;
    private int final_tenure;
    private double final_emi;
    private double total_amount_payable;
    private double total_interest_payable;
    private double charges_payable;
    private double late_payment_penalty;
    private double pre_payment_penalty;
    private LocalDateTime created_at;
    private LocalDateTime updated_at;
    private int borrower_account_id;
    private double total_penalty_payable;
    private String is_confirmed;

    public String getLoan_application_number() {
        return loan_application_number;
    }

    public void setLoan_application_number(String loan_application_number) {
        this.loan_application_number = loan_application_number;
    }

    public String getLoan_type() {
        return loan_type;
    }

    public void setLoan_type(String loan_type) {
        this.loan_type = loan_type;
    }

    public String getBorrower_name() {
        return borrower_name;
    }

    public void setBorrower_name(String borrower_name) {
        this.borrower_name = borrower_name;
    }

    public int getBorrower_user_id() {
        return borrower_user_id;
    }

    public void setBorrower_user_id(int borrower_user_id) {
        this.borrower_user_id = borrower_user_id;
    }

    public String getBorrower_email() {
        return borrower_email;
    }

    public void setBorrower_email(String borrower_email) {
        this.borrower_email = borrower_email;
    }

    public double getFinal_loan_amount() {
        return final_loan_amount;
    }

    public void setFinal_loan_amount(double final_loan_amount) {
        this.final_loan_amount = final_loan_amount;
    }

    public double getFinal_interest_rate() {
        return final_interest_rate;
    }

    public void setFinal_interest_rate(double final_interest_rate) {
        this.final_interest_rate = final_interest_rate;
    }

    public int getFinal_tenure() {
        return final_tenure;
    }

    public void setFinal_tenure(int final_tenure) {
        this.final_tenure = final_tenure;
    }

    public double getFinal_emi() {
        return final_emi;
    }

    public void setFinal_emi(double final_emi) {
        this.final_emi = final_emi;
    }

    public double getTotal_amount_payable() {
        return total_amount_payable;
    }

    public void setTotal_amount_payable(double total_amount_payable) {
        this.total_amount_payable = total_amount_payable;
    }

    public double getTotal_interest_payable() {
        return total_interest_payable;
    }

    public void setTotal_interest_payable(double total_interest_payable) {
        this.total_interest_payable = total_interest_payable;
    }

    public double getCharges_payable() {
        return charges_payable;
    }

    public void setCharges_payable(double charges_payable) {
        this.charges_payable = charges_payable;
    }

    public double getLate_payment_penalty() {
        return late_payment_penalty;
    }

    public void setLate_payment_penalty(double late_payment_penalty) {
        this.late_payment_penalty = late_payment_penalty;
    }

    public double getPre_payment_penalty() {
        return pre_payment_penalty;
    }

    public void setPre_payment_penalty(double pre_payment_penalty) {
        this.pre_payment_penalty = pre_payment_penalty;
    }

    public LocalDateTime getCreated_at() {
        return created_at;
    }

    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }

    public LocalDateTime getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(LocalDateTime updated_at) {
        this.updated_at = updated_at;
    }

    public int getBorrower_account_id() {
        return borrower_account_id;
    }

    public void setBorrower_account_id(int borrower_account_id) {
        this.borrower_account_id = borrower_account_id;
    }

    public double getTotal_penalty_payable() {
        return total_penalty_payable;
    }

    public void setTotal_penalty_payable(double total_penalty_payable) {
        this.total_penalty_payable = total_penalty_payable;
    }

    public String getIs_confirmed() {
        return is_confirmed;
    }

    public void setIs_confirmed(String is_confirmed) {
        this.is_confirmed = is_confirmed;
    }
}
