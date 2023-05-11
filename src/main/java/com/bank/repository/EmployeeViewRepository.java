package com.bank.repository;

import com.bank.models.EmployeeView;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployeeViewRepository extends CrudRepository<EmployeeView, Integer> {

    @Query(value = "SELECT * FROM v_employee", nativeQuery = true)
    List<EmployeeView> getEmployeeView();
}
