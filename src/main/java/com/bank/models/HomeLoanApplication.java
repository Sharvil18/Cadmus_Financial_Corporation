package com.bank.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import org.hibernate.type.descriptor.jdbc.BlobJdbcType;
import org.hibernate.type.descriptor.jdbc.LobTypeMappings;

import java.io.File;
import java.math.BigDecimal;
import java.sql.Blob;
import java.time.LocalDate;

@Entity
public class HomeLoanApplication {

    @Id
    private int user_id;
    @Column(unique = true)
    @NotNull
    private String application_number;
    @NotNull
    private String first_name;
    @NotNull
    private String last_name;
    @NotNull
    private String email;
    @NotNull
    private String contact;
    @NotNull
    private String religion;
    @NotNull
    private int age;
    @NotNull
    private LocalDate birth_date;
    @NotNull
    private String marital_status;
    @Lob
    @Column(columnDefinition = "LONGBLOB")
    @NotNull
    private byte[] proof_of_identity;


    @NotNull
    private String address_house;
    @NotNull
    private String address_complex;
    @NotNull
    private String address_street_line1;
    @NotNull
    private String address_street_line2;
    @NotNull
    private String address_city;
    @NotNull
    private String address_state;
    @NotNull
    private String address_postal_code;
    @Lob
    @Column(columnDefinition = "LONGBLOB")
    @NotNull
    private byte[] address_proof;

    @NotNull
    private String company_name;
    @NotNull
    private String job_title;
    @NotNull
    private String employment_status;
    @NotNull
    private int employment_period;
    @NotNull
    private String work_mode;
    @NotNull
    private String department;
    @NotNull
    private double salary;
    @NotNull
    private String industry;
    @Lob
    @Column(columnDefinition = "LONGBLOB")
    byte[] salary_slip;

    @NotNull
    private double income;
    @NotNull
    private double investment;
    @NotNull
    private double credit_card_debt;
    @NotNull
    private int account;
    @Lob
    @Column(columnDefinition = "LONGBLOB")
    @NotNull
    private byte[] bank_account_statement;

    @NotNull
    private BigDecimal purchase_price;
    @NotNull
    private BigDecimal loan_amount_requested;
    @NotNull
    private BigDecimal down_payment_amount;
    @NotNull
    private String current_home;
    @NotNull
    private String sell_current;
    @NotNull
    private String motto_purchase;

    private String approved;
    private String confirm;


    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getApplication_number() {
        return application_number;
    }

    public void setApplication_number(String application_number) {
        this.application_number = application_number;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getReligion() {
        return religion;
    }

    public void setReligion(String religion) {
        this.religion = religion;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public LocalDate getBirth_date() {
        return birth_date;
    }

    public void setBirth_date(LocalDate birth_date) {
        this.birth_date = birth_date;
    }

    public String getMarital_status() {
        return marital_status;
    }

    public void setMarital_status(String marital_status) {
        this.marital_status = marital_status;
    }

    public byte[] getProof_of_identity() {
        return proof_of_identity;
    }

    public void setProof_of_identity(byte[] proof_of_identity) {
        this.proof_of_identity = proof_of_identity;
    }

    public String getAddress_house() {
        return address_house;
    }

    public void setAddress_house(String address_house) {
        this.address_house = address_house;
    }

    public String getAddress_complex() {
        return address_complex;
    }

    public void setAddress_complex(String address_complex) {
        this.address_complex = address_complex;
    }

    public String getAddress_street_line1() {
        return address_street_line1;
    }

    public void setAddress_street_line1(String address_street_line1) {
        this.address_street_line1 = address_street_line1;
    }

    public String getAddress_street_line2() {
        return address_street_line2;
    }

    public void setAddress_street_line2(String address_street_line2) {
        this.address_street_line2 = address_street_line2;
    }

    public String getAddress_city() {
        return address_city;
    }

    public void setAddress_city(String address_city) {
        this.address_city = address_city;
    }

    public String getAddress_state() {
        return address_state;
    }

    public void setAddress_state(String address_state) {
        this.address_state = address_state;
    }

    public String getAddress_postal_code() {
        return address_postal_code;
    }

    public void setAddress_postal_code(String address_postal_code) {
        this.address_postal_code = address_postal_code;
    }

    public byte[] getAddress_proof() {
        return address_proof;
    }

    public void setAddress_proof(byte[] address_proof) {
        this.address_proof = address_proof;
    }

    public String getCompany_name() {
        return company_name;
    }

    public void setCompany_name(String company_name) {
        this.company_name = company_name;
    }

    public String getJob_title() {
        return job_title;
    }

    public void setJob_title(String job_title) {
        this.job_title = job_title;
    }

    public String getEmployment_status() {
        return employment_status;
    }

    public void setEmployment_status(String employment_status) {
        this.employment_status = employment_status;
    }

    public int getEmployment_period() {
        return employment_period;
    }

    public void setEmployment_period(int employment_period) {
        this.employment_period = employment_period;
    }

    public String getWork_mode() {
        return work_mode;
    }

    public void setWork_mode(String work_mode) {
        this.work_mode = work_mode;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }

    public byte[] getSalary_slip() {
        return salary_slip;
    }

    public void setSalary_slip(byte[] salary_slip) {
        this.salary_slip = salary_slip;
    }

    public double getIncome() {
        return income;
    }

    public void setIncome(double income) {
        this.income = income;
    }

    public double getInvestment() {
        return investment;
    }

    public void setInvestment(double investment) {
        this.investment = investment;
    }

    public double getCredit_card_debt() {
        return credit_card_debt;
    }

    public void setCredit_card_debt(double credit_card_debt) {
        this.credit_card_debt = credit_card_debt;
    }

    public int getAccount() {
        return account;
    }

    public void setAccount(int account) {
        this.account = account;
    }

    public byte[] getBank_account_statement() {
        return bank_account_statement;
    }

    public void setBank_account_statement(byte[] bank_account_statement) {
        this.bank_account_statement = bank_account_statement;
    }

    public BigDecimal getPurchase_price() {
        return purchase_price;
    }

    public void setPurchase_price(BigDecimal purchase_price) {
        this.purchase_price = purchase_price;
    }

    public BigDecimal getLoan_amount_requested() {
        return loan_amount_requested;
    }

    public void setLoan_amount_requested(BigDecimal loan_amount_requested) {
        this.loan_amount_requested = loan_amount_requested;
    }

    public BigDecimal getDown_payment_amount() {
        return down_payment_amount;
    }

    public void setDown_payment_amount(BigDecimal down_payment_amount) {
        this.down_payment_amount = down_payment_amount;
    }

    public String getCurrent_home() {
        return current_home;
    }

    public void setCurrent_home(String current_home) {
        this.current_home = current_home;
    }

    public String getSell_current() {
        return sell_current;
    }

    public void setSell_current(String sell_current) {
        this.sell_current = sell_current;
    }

    public String getMotto_purchase() {
        return motto_purchase;
    }

    public void setMotto_purchase(String motto_purchase) {
        this.motto_purchase = motto_purchase;
    }

    public String getApproved() {
        return approved;
    }

    public void setApproved(String approved) {
        this.approved = approved;
    }

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }

}