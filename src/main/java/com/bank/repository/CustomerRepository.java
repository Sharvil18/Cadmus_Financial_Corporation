package com.bank.repository;

import com.bank.models.Customer;
import jakarta.persistence.Table;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CustomerRepository extends CrudRepository<Customer, Integer> {

    @Query(value = "SELECT * FROM v_customer", nativeQuery = true)
    List<Customer> getAllCustomers();

    @Query(value = "SELECT * FROM v_customer ORDER BY user_id", nativeQuery = true)
    List<Customer> getCustomersOrderByID();

    @Query(value = "SELECT * FROM v_customer ORDER BY user_id DESC", nativeQuery = true)
    List<Customer> getCustomersOrderByIDDesc();

    @Query(value = "SELECT * FROM v_customer ORDER BY name", nativeQuery = true)
    List<Customer> getCustomersOrderByName();

    @Query(value = "SELECT * FROM v_customer ORDER BY name DESC", nativeQuery = true)
    List<Customer> getCustomersOrderByNameDesc();

    @Query(value = "SELECT * FROM v_customer ORDER BY created_at", nativeQuery = true)
    List<Customer> getCustomersOrderByCreatedAt();

    @Query(value = "SELECT * FROM v_customer ORDER BY created_at DESC", nativeQuery = true)
    List<Customer> getCustomersOrderByCreatedAtDesc();

    @Query(value = "SELECT * FROM v_customer ORDER BY updated_at", nativeQuery = true)
    List<Customer> getCustomersOrderByUpdateDAt();

    @Query(value = "SELECT * FROM v_customer ORDER BY updated_at DESC", nativeQuery = true)
    List<Customer> getCustomersOrderByUpdateDAtDesc();

    @Query(value = "SELECT * FROM v_customer ORDER BY verified_at", nativeQuery = true)
    List<Customer> getCustomersOrderByVerifiedAt();

    @Query(value = "SELECT * FROM v_customer ORDER BY verified_at DESC", nativeQuery = true)
    List<Customer> getCustomersOrderByVerifiedAtDesc();

    @Query(value = "SELECT * FROM v_customer ORDER BY account_count", nativeQuery = true)
    List<Customer> getCustomersOrderByAccountCount();

    @Query(value = "SELECT * FROM v_customer ORDER BY account_count DESC", nativeQuery = true)
    List<Customer> getCustomersOrderByAccountCountDesc();
}
