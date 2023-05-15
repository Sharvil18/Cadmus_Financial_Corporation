package com.bank.repository;

import com.bank.models.Customer;
import com.bank.models.Employee;
import com.bank.models.PaymentHistory;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PaymentHistoryRepository extends CrudRepository<PaymentHistory, Integer> {
    @Query(value = "SELECT * FROM v_payments where user_id = :user_id ORDER BY created_at", nativeQuery = true)
    List<PaymentHistory> getPaymentRecordsById(@Param("user_id") int user_id);

    @Query(value = "SELECT * FROM v_payments", nativeQuery = true)
    List<PaymentHistory> getAllPayments();

    @Query(value = "SELECT * FROM v_payments ORDER BY payment_id", nativeQuery = true)
    List<PaymentHistory> getCustomersOrderByPaymentId();

    @Query(value = "SELECT * FROM v_payments ORDER BY payment_id DESC", nativeQuery = true)
    List<PaymentHistory> getCustomersOrderByPaymentIdDesc();

    @Query(value = "SELECT * FROM v_payments ORDER BY account_id", nativeQuery = true)
    List<PaymentHistory> getCustomersOrderByAccountId();

    @Query(value = "SELECT * FROM v_payments ORDER BY account_id DESC", nativeQuery = true)
    List<PaymentHistory> getCustomersOrderByAccountIdDesc();

    @Query(value = "SELECT * FROM v_payments ORDER BY user_id", nativeQuery = true)
    List<PaymentHistory> getCustomersOrderByUserId();

    @Query(value = "SELECT * FROM v_payments ORDER BY user_id DESC", nativeQuery = true)
    List<PaymentHistory> getCustomersOrderByUserIdDesc();

    @Query(value = "SELECT * FROM v_payments ORDER BY amount", nativeQuery = true)
    List<PaymentHistory> getCustomersOrderByAmount();

    @Query(value = "SELECT * FROM v_payments ORDER BY amount DESC", nativeQuery = true)
    List<PaymentHistory> getCustomersOrderByAmountDesc();

    @Query(value = "SELECT * FROM v_payments ORDER BY created_at", nativeQuery = true)
    List<PaymentHistory> getCustomersOrderByPaymentTime();

    @Query(value = "SELECT * FROM v_payments ORDER BY created_at DESC", nativeQuery = true)
    List<PaymentHistory> getCustomersOrderByPaymentTimeDesc();

    @Query(value="SELECT DISTINCT(account_id) FROM v_payments", nativeQuery = true)
    List<String> getDistinctAccountId();

    @Query(value = "SELECT * FROM v_payments where account_id=:account_id", nativeQuery = true)
    List<PaymentHistory> getSpecificAccountId(@Param("account_id") String account_id);

    @Query(value="SELECT DISTINCT(user_id) FROM v_payments", nativeQuery = true)
    List<String> getDistinctUserId();

    @Query(value = "SELECT * FROM v_payments where user_id=:user_id", nativeQuery = true)
    List<PaymentHistory> getSpecificUserId(@Param("user_id") String user_id);

    @Query(value="SELECT DISTINCT(beneficiary_bank) FROM v_payments", nativeQuery = true)
    List<String> getDistinctBeneficiaryBank();

    @Query(value = "SELECT * FROM v_payments where beneficiary_bank=:beneficiary_bank", nativeQuery = true)
    List<PaymentHistory> getSpecificBeneficiaryBank(@Param("beneficiary_bank") String beneficiary_bank);

    @Query(value="SELECT DISTINCT(status) FROM v_payments", nativeQuery = true)
    List<String> getDistinctStatus();

    @Query(value = "SELECT * FROM v_payments where status=:status", nativeQuery = true)
    List<PaymentHistory> getSpecificStatus(@Param("status") String status);

    @Query(value="SELECT DISTINCT(reason_code) FROM v_payments", nativeQuery = true)
    List<String> getDistinctReasonCode();

    @Query(value = "SELECT * FROM v_payments where reason_code=:reason_code", nativeQuery = true)
    List<PaymentHistory> getSpecificReasonCode(@Param("reason_code") String reason_code);

}
