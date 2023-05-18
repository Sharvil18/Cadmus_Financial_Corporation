package com.bank.repository;

import com.bank.models.TransactionHistory;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TransactHistoryRepository extends CrudRepository<TransactionHistory, Integer> {

    @Query(value = "SELECT * FROM v_transaction_history WHERE user_id = :user_id ORDER BY created_at", nativeQuery = true)
    List<TransactionHistory> getTransactionRecordsById(@Param("user_id")int user_id);

    @Query(value = "SELECT * FROM v_transaction_history ORDER BY created_at", nativeQuery = true)
    List<TransactionHistory> getAllTransactionRecords();
}